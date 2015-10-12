class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string     :review_id, null: false
      t.string     :user_id,      index: true, foreign_key: true
      t.string     :business_id,  index: true, foreign_key: true
      t.text       :text
      t.date       :date
      t.integer    :stars
      t.json       :votes,     default: {}

      t.timestamps null: false
    end

    add_index :reviews, :review_id, unique: true
  end
end

