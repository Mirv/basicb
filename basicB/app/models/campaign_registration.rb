class CampaignRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :dash
  belongs_to :player
  belongs_to :country
  belongs_to :campaign
end
