# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create!([
  {
    name: "Dogs from the street",
    description: "Giving them a happy and peaceful live",
    target_pledge_amount: 1500,
    website: "www.dogs.nl",
    pledging_ends_on: Time.now + 1.month,
    team_members: "Mary-ann Jasper",
    image_file_name: "dog.jpg"
  },
  {
    name: "Roses",
    description: "Roses are a friends best gift. To make them even happier give them oranic ones!",
    target_pledge_amount: 1000,
    website: "www.roses.nl",
    pledging_ends_on: Time.now + 1.month,
    team_members: "Jean-Christophe Jane",
    image_file_name: ""
  }
])
