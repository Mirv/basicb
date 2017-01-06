class Player < ApplicationRecord
  belongs_to :country
  
  validates_presence_of :screenname
end
