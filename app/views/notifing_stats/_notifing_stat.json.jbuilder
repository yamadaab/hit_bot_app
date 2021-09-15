json.extract! notifing_stat, :id, :user_id, :player_id, :kind, :target, :previous_stat, :created_at, :updated_at
json.url notifing_stat_url(notifing_stat, format: :json)
