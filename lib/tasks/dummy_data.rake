require "active_record"
require "active_record/fixtures"

namespace :dummy do
  namespace :data do
    desc "Load the generated dummy data into the current environment's database."
    task :import => :environment do
      ActiveRecord::Fixtures.reset_cache
      fixtures_folder = File.join(Rails.root, "test/dummy/data")
      fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
      ActiveRecord::Fixtures.create_fixtures(fixtures_folder, fixtures)
    end
  end
end
