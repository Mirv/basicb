require 'active_support/concern'

module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
  
    # testing hook - captures nil from AR assignment to db in one spot
    # ... result exposes a hash for that purpose
    attr_reader :result

    # Information existing pre object instanization
    @info

    # Internal generated info
    @enroll

    def initialize(campaign_id, current_user_id)
      
      # Results of each query are held here, nil means something went wrong ...
      # ... which allows us to destroy everything else to simulate rollback
      @result = Hash.new({})
      #  nil default for testing
      @result.default
      
      # info hash is received info, enroll is generated - nil default for testing
      @info = Hash.new({})
      @enroll = Hash.new({})
      @enroll.default

      @info[:user] = user_find(current_user_id)
      @info[:dashboard] = dash_find
      @info[:campaign] = Campaign.find(campaign_id)
    end

    ### Top level business logic methods
    def enrolling
      setup_in_campaign
      # run_enrollment
      setup_in_dashboard
      run_enrollment
      # If invalid - roll back @enroll creations, else commit to db stand
      if(invalid_enrollment?(@enroll))
        remove_changes(@enroll)
      end
    end
    
    def setup_in_campaign
      @result[:player] = create_campaign_player
      @result[:organization] = create_campaign_organization
    end
    
    def setup_in_dashboard
      @result[:player_organization] = assign_organization_to_player
      @result[:dashboard_player] = assign_dashboard_player
      @result[:dashboard_organization] = assign_dashboard_organization
    end
    
    def run_enrollment
      @enroll.map {|key,value| value.save unless invalid(key, value)}
    end

    def invalid_enrollment?(a_hash)
      invalid_flag = false
      a_hash.map { |key, value| invalid_flag = true if invalid(key, value) }
      return invalid_flag
    end

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player(name = defaultPlayerName)
      name = ComposeName(name, Player.first)
      @enroll[:player] = @info[:campaign].players.create(screenname: name)
    end
    
    def create_campaign_organization(name = defaultOrganizationName)
      name = ComposeName(name, Country.first)
       @enroll[:organization] = @info[:campaign].countries.create(name: name)
    end
    
    def assign_organization_to_player
      @enroll[:player_organization] = Playercountry.new(
        country_id: @enroll[:organization].id, 
        player_id: @enroll[:player].id)
    end
     
    def assign_dashboard_player
      @enroll[:dashboard_player] = Dashplayer.new(
        player_id: @enroll[:player].id, 
        dash_id: @info[:dashboard].id)
    end
    
    def assign_dashboard_organization
      @enroll[:dashboard_organization] = Dashcount.new(
        country_id: @enroll[:organization].id, 
        dash_id: @info[:dashboard].id)
    end
    
    # Not tested

    def ComposeName(baseName, tableObject)
      total_rows = row_count_obj(tableObject)
      "#{baseName}##{row_count_unique(total_rows)}"
    end
    
    def defaultOrganizationName
      "A mysterious group ... "
    end
    
    def defaultPlayerName
      "A shadowy & mysterious figure ... "
    end
    
    def defaultCampaignName
      "A mysterious mission in a far away place ..." 
    end
    
    def defaultDashName
      "A mysterious mirror ... " 
    end
  
  ### Low level stuff
    def invalid(key, value)
      return (key.nil? || value.invalid?)
    end
  
    def remove_changes(a_hash)
      a_hash.map {|x,y| y.destroy }
    end
    
    def user_find(current_user_id)
      User.find(current_user_id || User.create(name: "Default"))
    end
  
    def dash_find
      @info[:user].dashes.first || Dash.create(name: "Default")
    end
  
    # issues with if initial object doesn't load due to validation
    # ... the number saved in name might be in use
    def row_count_unique(number)
      rand(1000) * rand(1000) * rand(number)
    end
  
    # count of all rows in db of passed active record object
    # Maybe figure out how to use the ruby class to derive ...
    # ... https://ruby-doc.org/core-2.1.0/Module.html#method-i-const_get
    def row_count_obj(ar_object)
      ar_object.class.name.constantize.count + 1
    end
  
    def Organization_count
      Country.count
    end
    
  end
end


