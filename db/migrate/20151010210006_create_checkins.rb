class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :business_id, index: true, foreign_key: true
      t.json   :info, default: {}

      t.timestamps null: false
    end
  end
end
