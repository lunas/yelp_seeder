class Checkin < ActiveRecord::Base
  belongs_to :business


  def self.build_from_json(json_line)
    checkin_obj = JSON.parse(json_line)
    c = Checkin.new({
                       business_id: checkin_obj['business_id'],
                       info: checkin_obj['info'],
                   })
    c.save
  end

end
