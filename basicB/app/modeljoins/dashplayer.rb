class Dashplayer < ApplicationRecord
  belongs_to :dash
  belongs_to :player
  
  validates :dash_id, presence: true
  validates :player_id, presence: true
end
