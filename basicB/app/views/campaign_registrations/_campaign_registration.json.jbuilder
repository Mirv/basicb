json.extract! campaign_registration, :id, :user_id, :dash_id, :campaign_id, :player_id, :country_id, :created_at, :updated_at
json.url campaign_registration_url(campaign_registration, format: :json)
