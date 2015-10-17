json.array!(@items) do |item|
  json.extract! item, :id, :user_id, :title, :track, :shared, :likes, :created_at, :updated_at
  json.url item_url(item)
end
