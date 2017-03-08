class Dash < ApplicationRecord
  belongs_to :user
  
  # campaigns I run
  has_many :dashcampaigns
  has_many :campaigns, through: :dashcampaigns
  
  # players I run in campaigns
  has_many :dashplayers
  has_many :players, through: :dashplayers
end
