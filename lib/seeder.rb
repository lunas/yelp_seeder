##
# Create Production-DB yelp_production, then run
#     RAILS_ENV=production rake db:migrate
# Then seed the data from the json files with
#     RAILS_ENV=production rails r "require './lib/seeder.rb'; s = Seeder.new; s.seed"
#
class Seeder

  DATA_PATH = "#{Rails.root}/data/"
  TEST_MAX  = 100

  attr_reader :counters

  def initialize(options = {})
    @data_path = options[:data_path] || DATA_PATH
    @counters = {}
    @modus = options[:modus] || :production
  end


  def seed
    seed_users
    seed_businesses
    seed_reviews
    seed_checkins
    seed_tips
      print_counters
  end


  def seed_users
    line_by_line(:user) do |line|
      User.build_from_json line
    end
    line_by_line(:user) do |line|
      User.make_friends line
    end
  end


  def seed_businesses
    line_by_line(:business) do |line|
      Business.build_from_json line
    end
  end


  def seed_reviews
    line_by_line(:review) do |line|
      Review.build_from_json line
    end
  end


  def seed_checkins
    line_by_line(:checkin) do |line|
      Checkin.build_from_json line
    end
  end


  def seed_tips
    line_by_line(:tip) do |line|
      Tip.build_from_json line
    end
  end


  private

  def line_by_line(obj_type, &block)
    @counters[obj_type] = 0
    filename = File.join @data_path, "#{obj_type}.json"
    File.foreach(filename) do |line|
      yield line
      @counters[obj_type] += 1
      putc '.' if @counters[obj_type] % 1000 == 0
      break if test? and max_reached?(obj_type)
    end
  end


  def test?
    @modus == :test
  end


  def max_reached?(obj_type)
    @counters[obj_type] > TEST_MAX
  end

  def print_counters
    @counters.each_pair do |pair|
      puts "Imported #{pair.last} instances of #{pair.first}."
    end
  end

end


#seeder = Seeder.new
#seeder.seed_users