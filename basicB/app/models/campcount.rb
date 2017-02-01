class Campcount < ApplicationRecord
  belongs_to :campaign
  belongs_to :country
  
  validates :campaign_id, uniqueness: true
  validates :country_id, uniqueness: true
end
