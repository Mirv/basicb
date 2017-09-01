class Country < ApplicationRecord
  has_many :centers, class_name:  "Neighborhood",
                                  foreign_key: "target_id",
                                  dependent:   :destroy
  has_many :neighbors, through: :centers, source: :neighbor
  
  has_many  :states
  has_many  :counties, through: :states

  belongs_to  :player
  
  has_many  :campcounts
  has_many  :campaign, through: :campcounts
  
  validates :name, presence: true 
  #, uniqueness: true  # We remove the uniqueness as countries in different 
  # ... campaigns  need to be able to have same name ... will need a composite 
  # ... key check at some point

  accepts_nested_attributes_for :states, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :counties, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end