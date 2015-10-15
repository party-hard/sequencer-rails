json.array!(@items) do |item|
  json.extract! item, :id, :user_id, :title, :track, :data, :shared, :likes
end
