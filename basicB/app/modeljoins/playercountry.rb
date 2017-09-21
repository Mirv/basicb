class Playercountry < ApplicationRecord
  belongs_to :player, dependent: :destroy
  belongs_to :country, dependent: :destroy
end
