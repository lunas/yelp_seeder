class Tip < ActiveRecord::Base
  belongs_to :user
  belongs_to :business


  def self.build_from_json(json_line)
    tip_obj = JSON.parse(json_line)
    t = Tip.new({
                    user_id: tip_obj['user_id'],
                    business_id: tip_obj['business_id'],
                    likes: tip_obj['likes'],
                    date: cast_date(tip_obj['date']),
                    text: tip_obj['text'],
                    })
    t.save
  end


  def self.cast_date(date_string)
    return nil if date_string.nil?
    Date.strptime(date_string, '%Y-%m-%d')
  end

end
