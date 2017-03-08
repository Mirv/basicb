class Player < ApplicationRecord
  has_many  :countries
  
  # reverse of campaigns owning players
  has_many  :campplays
  has_many  :campaigns, through: :campplays
  
  # reverse of dash via dashplayer owning players
  has_many  :dashplayers
  has_many  :dash, through: :dashplayers

  validates :screenname, presence: true
end
