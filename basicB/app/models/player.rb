class Player < ApplicationRecord
  

  # reverse of campaigns owning players
  has_many  :campplays
  has_one  :campaign, through: :campplays
  
  # reverse of dash via dashplayer owning players
  has_many  :dashplayers
  has_many  :dashes, through: :dashplayers
  
  has_many :userplays
  has_one  :user, through: :userplays
  
  has_many :playercountries
  has_many :countries, through: :playercountries

  validates :name, presence: true
end
