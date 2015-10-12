class Business < ActiveRecord::Base

  self.primary_key = 'business_id'

  has_many :reviews
  has_many :checkins
  has_many :tips
  has_many :categories
  has_one  :schedule

  def self.build_from_json(json_line)
    business_obj = JSON.parse(json_line)
    b = Business.new({
                     name: business_obj['name'],
                     full_address: business_obj['full_address'],
                     city: business_obj['city'],
                     state: business_obj['state'],
                     longitude: business_obj['longitude'],
                     latitude: business_obj['latitude'],
                     stars: business_obj['stars'],
                     review_counts: business_obj['review_counts'],
                     neighborhoods: business_obj['neighborhoods'],
                     attribs: business_obj['attributes'],
                     open: business_obj['open'] == 'true',
                 })
    b.business_id = business_obj['business_id']
    b.save

    schedule_obj = business_obj['hours']
    b.create_schedule(
         mo_open: schedule_obj['Monday'].try(:[], 'open'),
         mo_close: schedule_obj['Monday'].try(:[], 'close'),
         tu_open: schedule_obj['Tuesday'].try(:[], 'open'),
         tu_close: schedule_obj['Tuesday'].try(:[], 'close'),
         we_open: schedule_obj['Wednesday'].try(:[], 'open'),
         we_close: schedule_obj['Wednesday'].try(:[], 'close'),
         th_open: schedule_obj['Thursday'].try(:[], 'open'),
         th_close: schedule_obj['Thursday'].try(:[], 'close'),
         fr_open: schedule_obj['Friday'].try(:[], 'open'),
         fr_close: schedule_obj['Friday'].try(:[], 'close'),
         sa_open: schedule_obj['Saturday'].try(:[], 'open'),
         sa_close: schedule_obj['Saturday'].try(:[], 'close'),
         su_open: schedule_obj['Sunday'].try(:[], 'open'),
         su_close: schedule_obj['Sunday'].try(:[], 'close')
    )
    business_obj['categories'].each do |cat_name|
      b.categories.create( name:  cat_name)
    end
  end

end
