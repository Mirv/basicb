require 'active_support/concern'

module Registering
  extend ActiveSupport::Concern

  # Can this be included to be called in member notation (x.signPlayer)?
  def signPlayer(player, campaign)
    @player = campaign.campplays.new(player_id: player)
  end
  
end

class PHelpers
  include Registering
  
  def defaultPlayer
    @player_info = { screenname: "A shadowy & mysterious figure ... " }
  end
  
  def assignDash(owner)
    dash = setDash
    owner.dashplayers.create(dash_id: dash.id)
  end
end