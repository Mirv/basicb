class County < ApplicationRecord
  belongs_to :state
  
  validates_presence_of :name
end
