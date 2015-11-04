json.array!(@hangouts) do |hangout|
  json.extract! hangout, :id, :user_id, :event_id
  json.url hangout_url(hangout, format: :json)
end
