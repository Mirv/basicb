class Player < ApplicationRecord
  belongs_to :country
  belongs_to :campaign
  belongs_to :userplay

  validates :screenname, presence: true
end
