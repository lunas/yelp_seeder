class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string     :review_id, null: false
      t.references :user,      index: true
      t.references :business,  index: true
      t.text       :text
      t.date       :date
      t.integer    :stars
      t.json       :votes,     default: {}

      t.timestamps null: false
    end

    add_index :reviews, :review_id, unique: true
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :businesses
  end
end

