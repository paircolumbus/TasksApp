# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |x|
	if x % 2 == 0
  	Task.create(description: Faker::Lorem.sentence, completed: true) 
  else 
  	Task.create(description: Faker::Lorem.sentence, completed: false)
  end
end