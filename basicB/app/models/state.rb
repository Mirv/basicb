class State < ApplicationRecord
  belongs_to :country, inverse_of: :state
end
