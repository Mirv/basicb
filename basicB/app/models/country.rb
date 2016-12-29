class Country < ApplicationRecord
  has_many :states
  
  validates_presence_of :name
  
  # accepts_nested_attributes_for :states
end
