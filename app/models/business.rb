class Business < ActiveRecord::Base

  self.primary_key = 'business_id'

  has_many :reviews
  has_many :checkins
  has_many :tips
  has_many :schedules
  has_many :categories

end
