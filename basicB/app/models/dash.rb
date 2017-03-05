class Dash < ApplicationRecord
  belongs_to :user
  has_many :dashcampaigns
  has_many :campaigns, through: :dashcampaigns
  has_many :dashplayers
  has_many :players, through: :dashplayers
end
