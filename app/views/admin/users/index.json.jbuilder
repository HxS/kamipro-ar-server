json.array!(@users) do |user|
  json.extract! user, :id, :uuid
  json.url user_url(user, format: :json)
end
