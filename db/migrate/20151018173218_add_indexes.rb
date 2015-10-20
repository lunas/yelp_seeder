class AddIndexes < ActiveRecord::Migration
  def change
    # add_index :friendships, :friend_id
    add_index :reviews, :date
    add_index :reviews, :stars
    add_index :businesses, :stars
    add_index :users, :fans
    add_index :users, :average_stars
  end
end
