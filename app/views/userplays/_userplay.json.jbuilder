json.extract! userplay, :id, :campaign_id, :player_id, :created_at, :updated_at
json.url userplay_url(userplay, format: :json)