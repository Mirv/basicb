class Dash < ApplicationRecord
  has_many  :userdashes
  has_many  :users, through: :userdashes
  
  # campaigns I run
  has_many :dashcampaigns
  has_many :campaigns, through: :dashcampaigns
  
  # players I run in campaigns
  has_many :dashplayers
  has_many :players, through: :dashplayers
end
