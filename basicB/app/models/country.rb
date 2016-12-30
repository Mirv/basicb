class Country < ApplicationRecord
  has_many :states, inverse_of: :country
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :states, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end
