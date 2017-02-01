class Player < ApplicationRecord
  belongs_to :country
  belongs_to :campaign
  validates :screenname, presence: true
end
