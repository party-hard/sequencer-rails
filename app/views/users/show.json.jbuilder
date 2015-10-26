json.user @user, :id, :name, :image_url, :created_at, :updated_at
json.number_of_items @number_of_items
json.items @items do |item|
  json.extract! item, :id, :user_id, :title, :track, :likes, :shared, :created_at, :updated_at
  json.url item_url(item)
end
if @user[:id] == current_user[:id]
  json.logout logout_url
end

