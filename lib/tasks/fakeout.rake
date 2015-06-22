# a simple/configurable rake task that generates some random fake data for the app (using faker) at various sizes
# NOTE: requires the faker or ffaker gem 
#   sudo gem install faker - http://faker.rubyforge.org
#   OR
#   sudo gem install ffaker - http://github.com/EmmanuelOga/ffaker

require 'faker'

class Fakeout

  # START Customizing

  # 1. first these are the model names we're going to fake out, note in this example, we don't create tags/taggings specifically
  # but they are defined here so they get wiped on the clean operation
  # e.g. this example fakes out, Users, Questions and Answers, and in doing so fakes some Tags/Taggings
  MODELS = %w(Entry)

  # 2. now define a build method for each model, returning a list of attributes for Model.create! calls
  # check out the very excellent faker gem rdoc for faking out anything from emails, to full addresses; http://faker.rubyforge.org/rdoc
  # NOTE: a build_??? method MUST exist for each model you specify above
  # in this example i'm faking out time - like Marty McFly!
  

  # in this example i'm faking out time again! - this time to be after the question's created at time
  def build_entry
    answer_time = Faker::Time.between(2.days.ago, Time.now, :all)
      rnd = Array.new(2)
      rnd[0] =[true, false].sample
      rnd[1] =[true, false].sample
      if(!rnd[0] && !rnd[1])
        rnd[rand(2)] = true
      end
    { :fname            => Faker::Name.first_name,
      :lname            => Faker::Name.last_name,
      :pink             => rnd[0],
      :yellow           => rnd[1],
      :age              => rand(13),
      :parent           => Faker::Name.name,
      :guard            => Faker::Name.name,
      :tested           => Faker::Date.between(2.days.ago, Date.today),
      :created_at       => answer_time,
      :updated_at       => answer_time,
    }
  end

  # return nil, or an empty hash for models you don't want to be faked out on create, but DO want to be clearer away
  def build_tag; end

  def build_tagging; end
  
  # called after faking out, use this method for additional updates or additions
  def post_fake
  end

  # 3. optionally you can change these numbers, basically they are used to determine the number of models to create
  # and also the size of the tags array to choose from.  To check things work quickly use the tiny size (1 for everything)
  def tiny
    1
  end
  
  def small
    25+rand(50)
  end

  def medium
    250+rand(250)
  end

  def large
    1000+rand(500)
  end

  # END Customizing

  attr_accessor :all_tags, :size

  def initialize(size, prompt=true)
    self.size     = size
    self.all_tags = Faker::Lorem.words(send(size))
  end

  def fakeout
    puts "Faking it ... (#{size})"
    Fakeout.disable_mailers
    MODELS.each do |model|
      if !respond_to?("build_#{model.downcase}")
        puts "  * #{model.pluralize}: **warning** I couldn't find a build_#{model.downcase} method"
        next
      end
      1.upto(send(size)) do
        attributes = send("build_#{model.downcase}")
        model.constantize.create!(attributes) if attributes && !attributes.empty?
      end
      puts "  * #{model.pluralize}: #{model.constantize.count(:all)}"
    end
    post_fake
    puts "Done, I Faked it!"
  end
  
  def self.prompt
    puts "Really? This will clean all #{MODELS.map(&:pluralize).join(', ')} from your test database y/n? "
    STDOUT.flush
    (STDIN.gets =~ /^y|^Y/) ? true : exit(0)
  end

  def self.clean(prompt = true)
    self.prompt if prompt
    puts "Cleaning all ..."
    Fakeout.disable_mailers
    MODELS.each do |model|
      model.constantize.delete_all
    end
  end

  # by default, all mailings are disabled on faking out
  def self.disable_mailers
    ActionMailer::Base.perform_deliveries = false
  end
  
  
  private
  # pick a random model from the db, done this way to avoid differences in mySQL rand() and postgres random()
  def pick_random(model, optional = false)
    return nil if optional && (rand(2) > 0)
    ids = ActiveRecord::Base.connection.select_all("SELECT id FROM #{model.to_s.tableize}")
    model.find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end

  # useful for prepending to a string for getting a more unique string
  def random_letters(length = 2)
    Array.new(length) { (rand(122-97) + 97).chr }.join
  end

  # pick a random number of tags up to max_tags, from an array of words, join the result with seperator
  def random_tag_list(tags, max_tags = 5, seperator = ',')
    start = rand(tags.length)
    return '' if start < 1
    tags[start..(start+rand(max_tags))].join(seperator)
  end

  # fake a time from: time ago + 1-8770 (a year) hours after
  def fake_time_from(time_ago = 1.year.ago)
    time_ago+(rand(8770)).hours
  end
end


# the tasks, hook to class above - use like so;
# rake fakeout:clean
# rake fakeout:small[noprompt] - no confirm prompt asked, useful for heroku or non-interactive use
# rake fakeout:medium RAILS_ENV=bananas
#.. etc.
namespace :fakeout do

  desc "clean away all data"
  task :clean, [:no_prompt] => :environment do |t, args|
    Fakeout.clean(args.no_prompt.nil?)
  end
  
  desc "fake out a tiny dataset"
  task :tiny, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:tiny).fakeout
  end

  desc "fake out a small dataset"
  task :small, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:small).fakeout
  end

  desc "fake out a medium dataset"
  task :medium, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:medium).fakeout
  end

  desc "fake out a large dataset"
  task :large, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:large).fakeout
  end
end
