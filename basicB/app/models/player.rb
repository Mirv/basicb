class Player < ApplicationRecord
  has_many  :countries
  
  has_many  :campplays
  has_many  :campaigns, through: :campplays
  
  has_one   :userplay
  has_one   :user, through: :userplay

  validates :screenname, presence: true
end
