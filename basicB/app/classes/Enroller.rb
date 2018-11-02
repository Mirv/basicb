require 'active_support/concern'

module Enroller
  
  class Enroller
    extend ActiveSupport::Concern
    
    # testing hook - captures nil from AR assignment to db in one spot
    # ... result exposes a hash for that purpose
    attr_reader :result
    attr_reader :test
    attr_reader :info

    # Information existing pre object instanization
    @info

    # Internal generated info
    @enroll

    def initialize(campaign_id, current_user_id)
      raise ArgumentError.new("You can't use #{campaign_id} for a campaign_id") unless campaign_id.present?
      raise ArgumentError.new("You can't use #{current_user_id} for a user") unless current_user_id.present?
      @test = "Testing"
      
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
      @info[:campaign] = Campaign.find(campaign_id) || Campaign.first
    end

    ### Top level logic methods
    def enroll_player
      # byebug
      setup_in_campaign
      # run_enrollment
      setup_in_dashboard
      run_enrollment
      # If invalid - roll back @enroll creations, else commit to db stand
      if(invalid_enrollment?(@enroll))
        remove_changes(@enroll)
        @enroll.result = nil
      # else
      #   enroll_transaction('Campaign_registration')
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
      @enroll.map {|key,value| value.save unless value.invalid?}
    end

    def invalid_enrollment?(a_hash)
      invalid_flag = false
      a_hash.map { |key, value| invalid_flag = true if value.invalid? }
      return invalid_flag
    end

    ### Mid level business logic methods
    # ... player & organization are created off relationship model implicitly
    # ... then assign methods explicitly create entries on the join tables
    
    def create_campaign_player(name = Names.player)
      name = Names.compose(name, Player.first)
      @enroll[:player] = @info[:campaign].players.create(name: name)
    end
    
    def create_campaign_organization(name = Names.organization)
      name = Names.compose(name, Country.first)
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

  ### Low level stuff
    def remove_changes(a_hash)
      a_hash.map {|x,y| y.destroy }
    end
    
    def user_find(current_user_id)
      User.find(current_user_id || User.create(name: Names.user))
    end
  
    def dash_find
      @info[:user].dashes.first || Dash.create(name: Names.dash)
    end
  end
  
  ###
  ### class Enroller::Names ###
  ###
  class Names
    def self.compose(baseName, tableObject = nil)
      # if tableObject is nil, test to see if its an activerecord will bomb
      if tableObject.present?
        "#{baseName}##{row_count_obj(tableObject)}"
      else
        "#{baseName}##{row_count_unique}"
      end
    end
    
    def self.row_count_unique(number = 1000)
      a_num = 1000
      number = a_num unless (number > a_num) # if number is neg or lower its a bad seed
      a_num * a_num * number 
    end
  
    # count of all rows in db of passed active record object
    def self.row_count_obj(ar_object)
      if ar_object.class.ancestors.include?(ActiveRecord::Base)
        ar_object.class.name.constantize.count + 1
      else
        1
      end
    end
    
    def self.organization
      "A mysterious group ... "
    end
    
    def self.player
      "A shadowy & mysterious figure ... "
    end
    
    def self.campaign
      "A mysterious mission in a far away place ..." 
    end
    
    def self.dash
      "A mysterious mirror ... " 
    end
    
    def self.user
      "An entity so dark it does not know itself ... " 
    end
  end
end


