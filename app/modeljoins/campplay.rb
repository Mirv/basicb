class Campplay < ApplicationRecord
  belongs_to :campaign
  belongs_to :player
  
  validates :campaign_id, presence: true
  validates :player_id, presence: true
end
