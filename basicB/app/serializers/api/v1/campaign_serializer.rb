class Api::V1::CampaignSerializer < Api::V1::BaseSerializer
  attributes :id, :name, :description, :created_at, :updated_at

  belongs_to    :users 
  has_many      :countries
  has_many      :players

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end