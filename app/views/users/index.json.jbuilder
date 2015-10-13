json.array!(@users) do |user|
  json.extract! user, :id, :provider, :uid, :name, :location, :image_url, :url, :email
  json.url user_url(user, format: :json)
end
