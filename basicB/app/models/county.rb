class County < ApplicationRecord
  belongs_to :state, inverse_of: :county
  
  validates_presence_of :name
end
