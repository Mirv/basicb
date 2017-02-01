class State < ApplicationRecord
  belongs_to  :country
  has_many    :counties

  validates :name, presence: true
  
  # accepts_nested_attributes_for :neighbors
  # accepts_nested_attributes_for :borders
  accepts_nested_attributes_for :counties, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end
