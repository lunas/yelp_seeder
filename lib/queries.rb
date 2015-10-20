require 'csv'

module Queries

  # Table that lists for each business the maximal size of the groups of friends
  # that have reviewed this business.
  def max_rev_friends_group_per_business(options = {})
    filename       = options[:filename]       || 'business_max_friends.csv'
    max_businesses = options[:max_businesses] || Business.count
    batch_size     = options[:batch_size]     || 1000

    path = "#{Rails.root}/data/#{filename}"
    start_id = ''
    count = 1

    File.delete path  # Delete existing version of this file

    while count < max_businesses
      CSV.open(path, 'a') do |csv|
        businesses = Business.order(:business_id)
                         .where('business_id > ?', start_id).limit(batch_size)
        businesses.each do |business|
          row = [business.business_id, business.name, business.state, business.stars,
                 business.review_count, business.neighborhoods,
                 business.largest_friendly_group_reviewing_me.size]
          csv << row
          puts count
          count += 1
        end
        start_id = businesses.last.business_id
      end
    end
    path
  end

end