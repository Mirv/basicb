class Player < ApplicationRecord
  # belongs_to :country
  has_many  :countries
  belongs_to :campaign
  has_one   :userplay
  has_one   :user, through: :userplay

  validates :screenname, presence: true
end
