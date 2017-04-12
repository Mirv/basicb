class Campcount < ApplicationRecord
  belongs_to :campaign
  belongs_to :country
  
  validates :campaign_id, presence: true
  validates :country_id, presence: true
end
