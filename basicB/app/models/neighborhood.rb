class Neighborhood < ApplicationRecord
  belongs_to :neighbors, class_name: "Country"
  belongs_to :target, class_name: "Country"
  validates :neighbor_id, presence: true
  validates :target_id, presence: true
end
