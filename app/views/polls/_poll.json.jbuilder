json.extract! poll, :id, :title, :description, :user_id, :created_at, :updated_at
json.url poll_url(poll, format: :json)
