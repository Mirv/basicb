class Playercountry < ApplicationRecord
  belongs_to :country
  belongs_to :player
end
