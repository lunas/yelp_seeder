class Review < ActiveRecord::Base

  self.primary_key = 'review_id'

  belongs_to :user
  belongs_to :business


  def self.build_from_json(json_line)
    review_obj = JSON.parse(json_line)
    r = Review.new({
                         user_id: review_obj['user_id'],
                         business_id: review_obj['business_id'],
                         text: review_obj['text'],
                         date: cast_date(review_obj['date']),
                         stars: review_obj['stars'],
                         votes: review_obj['votes']
                     })
    r.review_id = review_obj['review_id']
    r.save
  end

  def self.cast_date(date_string)
    return nil if date_string.nil?
    Date.strptime(date_string, '%Y-%m-%d')
  end

end
