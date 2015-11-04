json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :what, :when, :where, :latitude, :longitude, :needed, :joined
  json.url event_url(event, format: :json)
end
