json.extract! event, :id, :organizer_id, :title, :start, :finish, :created_at, :updated_at
json.url event_url(event, format: :json)
