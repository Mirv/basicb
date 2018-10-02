class Api::V1::UserSerializer < Api::V1::BaseSerializer
  include ActiveHashRelation

  attributes :id, :email, :name,  :encrypted_password, :created_at, :updated_at

  has_many :dashes
  has_many :players
  has_many :campaigns

  def created_at
    # object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    # object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end