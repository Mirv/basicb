class Playercount < ApplicationRecord
    belongs_to :player
    belongs_to :country
end
