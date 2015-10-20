require 'rails_helper'

require "#{Rails.root}/lib/queries.rb"
include Queries

RSpec.describe 'Queries' do

  describe 'max_rev_friends_group_per_business' do

    it 'writes the lines to the csv file' do
      result_file = max_rev_friends_group_per_business( max_businesses: 5,
                                                        filename: 'rspec_test.csv',
                                                        batch_size: 3)
      lines = File.readlines result_file
      businesses = Business.order(:business_id).limit(6)
      0.upto(5).each do |i|
        expect( lines[i].split(',').first ).to eq businesses[i].business_id
      end
    end

    it 'writes more lines to the csv file' do

      allow_any_instance_of(Business).to receive(:largest_friendly_group_reviewing_me)
                                                         .and_return([1,2,3])

      result_file = max_rev_friends_group_per_business( max_businesses: 2000,
                                                        filename: 'rspec_test.csv',
                                                        batch_size: 1000)
      lines = File.readlines result_file
      businesses = Business.order(:business_id).limit(2000)
      0.upto(1999).each do |i|
        expect( lines[i].split(',').first ).to eq businesses[i].business_id
      end
    end

  end

end