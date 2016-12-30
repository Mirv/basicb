class State < ApplicationRecord
  belongs_to :country, inverse_of: :states
end
