class Playercountry < ApplicationRecord
  belongs_to :player
  belongs_to :country
  
  validates :player_id, presence: true
  validates :country_id, presence: true
end
