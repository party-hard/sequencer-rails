json.user current_user, :id, :name, :image_url
json.recent_items (current_user.items.sort_by(&:updated_at).take(20)) do |item|
  json.extract! item, :id, :title, :track, :likes, :updated_at
end
