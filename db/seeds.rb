# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.id = row[0]
    country.name = row[1]
    country.alpha2 = row[2]
  end
end

puts "Importing states..."
CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  State.create! do |state|
    state.code = row[1]
    state.country_id = row[2]
  end
end

puts "Importing states ja..."

CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  StateTranslation.create! do |state_translation|
    state_translation.state = State.where(country_id: row[2], code: row[1]).first
    state_translation.locale = "en"
    state_translation.name = row[0]
  end
end

CSV.foreach(Rails.root.join("states_ja.csv"), headers: true) do |row|
  StateTranslation.create! do |state_translation|
    state_translation.state = State.where(country_id: row[0], code: row[3]).first
    state_translation.locale = "ja"
    state_translation.name = row[2]
  end
end

