class Neighborhood < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :neighbor, class_name: "Country"
  belongs_to :target, class_name: "Country"
  validates :neighbor_id, presence: true 
  validates :notItsOwnNeighbor
  validates :target_id, presence: true
    
  def notItsOwnNeighbor
    if :neighbor_id == :target_id 
      errors.add(:neighbor_id, "cannot neighbor itself ... Original Country: #{target_id}, Neighbor: #{neighbor_id}")  
    elseif(neighborhood_params[:neighbor_id] == neighborhood_params[:other_id]) 
      return TRUE
    else
      puts "ID's were not found for one or both the neighbor & the neighboring country."
    end
  end
end

