class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string  :user_id,     index: true, foreign_key: true
      t.string  :business_id, index: true, foreign_key: true
      t.integer :likes
      t.date    :date
      t.text    :text

      t.timestamps null: false
    end
  end
end
