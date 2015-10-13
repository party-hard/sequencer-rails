class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :uid, null: false
      t.string :user_id, null: false
      t.string :title
      t.string :data
      t.boolean :shared
      t.integer :likes

      t.timestamps null: false
    end
    add_index :items, :user_id
    add_index :items, :uid, unique: true
  end
end
