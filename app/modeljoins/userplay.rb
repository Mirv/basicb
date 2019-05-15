class Userplay < ApplicationRecord
  belongs_to :player
  belongs_to :user

  validates :player_id, presence: true
  validates :user_id, presence: true
end
