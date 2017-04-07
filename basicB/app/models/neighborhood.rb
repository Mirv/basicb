class Neighborhood < ApplicationRecord
  belongs_to :neighbor, class_name: "Country"
  belongs_to :target, class_name: "Country"
  validates :neighbor_id, presence: true
  validates :target_id, presence: true
  
  def notItSelf(other_id)
    if self.id == other_id then
      raise Exception.new("A country can't be it's own neighbor!")
    end
  end
end
