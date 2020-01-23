# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat_attributes = [
  {
    name: 'Stinky Mary',
    age: 2,
    city: "My Van",
    bio: 'Currently doing a deodordant detox, because I am not like other cats.'
  },
  {
    name: 'Catberly',
    age: 17,
    city: "Warehouse of Modern Times",
    bio: 'Recently retired from the brewer life where I chased the mice out. Now rich AF as a kitty hacker. HMU you might want to see this.'
  },
  {
    name: 'Kittie Mulder',
    age: 7,
    city: "Beverly Hills",
    bio: 'Currently meowied but looking for some game on the side. :P Currently bamboozling all my hubbies munnies $$$$'
  }
]

cat_attributes.each do |attributes|
  Cat.create(attributes)
end
