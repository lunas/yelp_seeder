class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :business_id, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
