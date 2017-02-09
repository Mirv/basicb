class Userplay < ApplicationRecord
  belongs_to :campaign
  belongs_to :player
  belongs_to :user
  
  validates :campaign_id, presence: true
  validates :player_id, presence: true
end
