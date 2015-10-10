class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.references :user,     index: true, foreign_key: true
      t.references :business, index: true, foreign_key: true
      t.integer :likes
      t.date :date
      t.text :text

      t.timestamps null: false
    end
  end
end
