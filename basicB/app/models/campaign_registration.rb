class CampaignRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :dash
  belongs_to :player
  belongs_to :country
  belongs_to :campaign
  
  accepts_nested_attributes_for :player, :reject_if => :all_blank
  accepts_nested_attributes_for :country, :reject_if => :all_blank

end
