# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

filename = Rails.root.join("db/data/stadiums.csv")

CSV.foreach(filename, headers: true) do |row|
  row = row.to_hash

  Stadium.find_or_create_by(name: row['name']) do |stadium|
    stadium.city = row['city']
    stadium.state = row['state']
    stadium.capacity = row['capacity']
    stadium.playing_surface = row['playing_surface']
    stadium.roof_type = row['roof_type']
    stadium.team = row['team']
    stadium.photo = row['photo']
    stadium.seating_chart = row['seating_chart']
    stadium.description = row['description']
    stadium.year = row['year']
    puts "#{stadium.name} in database."
  end
end
