class Campaign < ApplicationRecord
  belongs_to :player_id
  has_many  :campplays
  has_many  :players, through: :campplays
  has_many  :campcounts
  has_many  :countries, through: :campcounts
  validates :name, presence: true
  default_scope { order(created_at: :desc) }

end