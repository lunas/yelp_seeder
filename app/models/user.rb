class User < ActiveRecord::Base

  self.primary_key = 'user_id'

  has_many :reviews
  has_many :tips

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def self.build_from_json(json_line)
    user_obj = JSON.parse(json_line)
    u = User.new({
          name: user_obj['name'],
          yelping_since: Date.strptime(user_obj['yelping_since'], '%Y-%m'),
          review_count: user_obj['review_count'],
          average_stars: user_obj['average_stars'],
          fans: user_obj['fans'],
          votes: user_obj['votes'],
          compliments: user_obj['compliments'],
          elite: user_obj['elite']
        })
    u.user_id = user_obj['user_id']
    u.save
  end


  def self.make_friends(json_line)
    user_obj = JSON.parse json_line
    user = User.find user_obj['user_id']
    user_obj['friends'].each do |friend_id|
      user.friendships.create friend_id: friend_id
    end
  end

end
