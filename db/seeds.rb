# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lists = List.create([{ name: "Onboarding" }, { name: "Other Stuff" }])
Task.create(description: "Read Documentation", completed: false, list: lists.first)
Task.create(description: "Do Tasks App", completed: true, list: lists.first)
Task.create(description: "Get Code Review", completed: false, list: lists.first)

Task.create(description: "Learn how to use confluence", completed: false, list: lists.last)
Task.create(description: "Get a snack", completed: false, list: lists.last)

