class Dashplayer < ApplicationRecord
  belongs_to :dash
  belongs_to :player
  
  validates :player, presence: true
  validates :dash, presence: true
 
end
