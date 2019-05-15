class Userdash < ApplicationRecord
  belongs_to :user
  belongs_to :dash
end
