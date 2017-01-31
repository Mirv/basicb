class Campcount < ApplicationRecord
  belongs_to :campaign
  belongs_to :country
end
