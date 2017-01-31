class Player < ApplicationRecord
  belongs_to :country
  belongs_to :campaign
  validates_presence_of :screenname
end
