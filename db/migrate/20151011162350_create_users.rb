class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url
      t.string :email

      t.timestamps null: false
    end
    add_index :users, :provider
    add_index :users, :uid, unique: true
    add_index :users, [:provider, :uid], unique: true
  end
end
