class Country < ApplicationRecord
  has_many :neighborhoods, class_name:  "Neighborhood",
                                  foreign_key: "neighbor_id",
                                  dependent:   :destroy
  has_many :centers, through: :neighborhoods, source: :target
  
  def add_neighbor(other_user)
    centers << other_user
  end
  
  def remove_neighbor(other_user)
    centers.delete(other_user)
  end
  
  def neighbors?(other_user)
    centers.include?(other_user)
  end
  
  
  has_many  :states
  has_many  :counties, :through => :state
  has_one   :player
  
  validates_presence_of :name

  accepts_nested_attributes_for :states, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :counties, reject_if: proc { |attributes| attributes[:name].blank? }, allow_destroy: true
end

