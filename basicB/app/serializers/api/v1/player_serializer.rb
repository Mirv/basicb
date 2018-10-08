class Api::V1::PlayerSerializer < Api::V1::BaseSerializer
  include ActiveHashRelation

  attributes :id, :name, :motto,  :country_id, :created_at, :updated_at

  belongs_to    :dashes
  belongs_to    :campaign
  has_many      :countries

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end