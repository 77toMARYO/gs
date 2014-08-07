json.array!(@users) do |user|
  json.extract! user, :id, :github_id, :used_point
  json.url user_url(user, format: :json)
end
