class AddTrackToItems < ActiveRecord::Migration
  def change
    add_column :items, :track, :boolean
  end
end
