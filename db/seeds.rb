# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# seeds.rb
require 'csv'

CSV.foreach("db/csv/cleaned-names.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  if row[7].present?
      date = row[7].split("/")
      if date[2] && date[2].length == 2
      	date[2] = "20" + date[2]
      end
      row[7] = "#{date[2]}/#{date[0]}/#{date[1]}"
   end
   Entry.create(row.to_hash)
end
