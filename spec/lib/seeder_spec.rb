require 'rails_helper'

require "#{Rails.root}/lib/seeder.rb"

RSpec.describe 'Seeder' do

  before do
    @seeder = Seeder.new modus: :test
  end

  describe 'Seed_users' do
    it 'creates users from user.json' do
      @seeder.seed_users
      expect( User.count ).to be > 0
      expect( User.count ).to eq @seeder.counters[:user]
    end
  end

  describe 'Seed_businesses' do
    it 'creates businesses from business.json' do
      @seeder.seed_businesses
      expect( Business.count ).to be > 0
      expect( Business.count ).to eq @seeder.counters[:business]
    end
  end

  describe 'Seed_reviews' do
    it 'creates reviews from review.json' do
      @seeder.seed_reviews
      expect( Review.count ).to be > 0
      expect( Review.count ).to eq @seeder.counters[:review]
    end
  end

  describe 'Seed_checkins' do
    it 'creates checkins from checkin.json' do
      @seeder.seed_checkins
      expect( Checkin.count ).to be > 0
      expect( Checkin.count ).to eq @seeder.counters[:checkin]
    end
  end

  describe 'Seed_tips' do
    it 'creates tips from tip.json' do
      @seeder.seed_tips
      expect( Tip.count ).to be > 0
      expect( Tip.count ).to eq @seeder.counters[:tip]
    end
  end

end