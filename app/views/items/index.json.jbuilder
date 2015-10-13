json.array!(@items) do |item|
  json.extract! item, :uid, :user_id, :title, :track, :data, :shared, :likes
  json.url item_url(item, format: :json)
end
