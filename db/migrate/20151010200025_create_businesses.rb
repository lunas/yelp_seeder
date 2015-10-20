class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_id, null:false
      t.string :name
      t.string :full_address
      t.string :city
      t.string :state
      t.float  :longitude
      t.float  :latitude
      t.decimal :stars
      t.integer :review_count
      t.string :neighborhoods, array: true, default: []
      t.json   :attribs, default: {}
      t.boolean :open

      t.timestamps null: false
    end

    add_index :businesses, :business_id, unique: true
  end
end
