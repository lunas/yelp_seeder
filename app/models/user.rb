class User < ActiveRecord::Base

  self.primary_key = 'user_id'

  has_many :reviews
  has_many :tips

  has_many :friends_ships
  has_many :friends, through: :friends_ships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

end
