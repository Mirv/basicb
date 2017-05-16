class CampaignRegistry < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :dash
  belongs_to :user
end
