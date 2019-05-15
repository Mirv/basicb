class Api::V1::CountrySerializer < Api::V1::BaseSerializer
  attributes :id, :name, :description, :created_at, :updated_at

  belongs_to    :campaign 
  has_many      :dashes
  has_many      :players
  has_many      :states
  has_many      :counties

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end