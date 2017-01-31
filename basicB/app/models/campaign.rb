class Campaign < ApplicationRecord
  belongs_to :player_id
  has_many  :campplays
  has_many  :players, through: :campplays
  has_many  :campcounts
  has_many  :countries, through: :campcounts
end
