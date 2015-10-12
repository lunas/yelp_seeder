require 'rails_helper'

require "#{Rails.root}/lib/seeder.rb"

RSpec.describe 'Seeder' do

  before do
    @seeder = Seeder.new modus: :test
  end

  describe 'Seed_users' do
    it 'creates users from user.json' do
      @seeder.seed_users
      expect( User.count ).to eq @seeder.counters[:user]
    end
  end
end