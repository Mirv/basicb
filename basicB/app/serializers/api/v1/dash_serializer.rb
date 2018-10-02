class Api::V1::DashSerializer < Api::V1::BaseSerializer
  attributes :id, :name, :created_at, :updated_at

  has_many :users
  has_many :countries
  has_many :campaigns

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end