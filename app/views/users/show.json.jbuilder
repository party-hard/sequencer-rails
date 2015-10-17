json.user @user, :id, :name, :image_url, :created_at, :updated_at
json.items @items do |item|
  json.extract! item, :id, :user_id, :title, :track, :likes, :shared, :created_at, :updated_at
  json.url item_url(item)
end

