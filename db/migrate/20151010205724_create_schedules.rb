class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :business_id, index: true, foreign_key: true
      t.time :mo_open
      t.time :mo_close
      t.time :tu_open
      t.time :tu_close
      t.time :we_open
      t.time :we_close
      t.time :th_open
      t.time :th_close
      t.time :fr_open
      t.time :fr_close
      t.time :sa_open
      t.time :sa_close
      t.time :su_open
      t.time :su_close

      t.timestamps null: false
    end
  end
end
