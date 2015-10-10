class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id, null: false
      t.string :name
      t.date :yelping_since
      t.integer :review_count
      t.float :average_stars
      t.integer :fans
      #t.column :votes, :json, default: '{}'
      t.json :votes, default: {}
      #t.column :compliments, :json, default: '{}'
      t.json :compliments, default: {}
      t.integer :elite, array:true, default: []

      t.timestamps
    end

    add_index :users, :user_id, unique: true
  end
end
