class Country < ApplicationRecord
  has_many :centers, class_name:  "Neighborhood",
                                  foreign_key: "target_id",
                                  dependent:   :destroy
  has_many :neighbors, through: :centers, source: :neighbor
  
  has_many  :states
  has_many  :counties, through: :state
  has_one   :player
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :states, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :counties, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end

