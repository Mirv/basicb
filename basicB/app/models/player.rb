class Player < ApplicationRecord
  
  has_many  :countries
  
  # reverse of campaigns owning players
  has_many  :campplays
  has_one  :campaign, through: :campplays
  
  # reverse of dash via dashplayer owning players
  has_many  :dashplayers
  has_many  :dash, through: :dashplayers
  
  has_many :userplays
  has_one  :user, through: :userplays

  validates :screenname, presence: true
end
