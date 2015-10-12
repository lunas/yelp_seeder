class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :user_id, index: true, foreign_key: true
      t.string :friend_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
