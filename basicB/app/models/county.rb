class County < ApplicationRecord
  belongs_to :state
  validates :name, uniqueness: true
end
