class State < ApplicationRecord
  belongs_to :country, inverse_of: :states
  has_many :counties, inverse_of: :states
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :counties, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end
