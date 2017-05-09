require 'active_support/concern'


class PlayHelpers < PHelpers

    extend ActiveSupport::Concern

    def self.createPlayer(owner)
      @player = Player.create!(screenname: defaultPlayer).save
      owner.dashplayers.create(player_id: @player.id)
    end

end