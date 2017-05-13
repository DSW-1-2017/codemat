# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating valid user
puts "Creating themes."
Theme.create([
  {name: "C++", icon_name: "fa icon-cplusplus"},
  {name: "Elixir", icon_name: "fa icon-elixir"},
  {name: "Ruby", icon_name: "fa icon-ruby"},
  {name: "Python", icon_name: "fa icon-python"},
  {name: "Javascript", icon_name: "fa icon-javascript"},
  {name: "Node", icon_name: "fa icon-nodejs"},
  {name: "Perl", icon_name: "fa icon-perl"},
  {name: "Shell", icon_name: "fa icon-shell"},
  {name: "Java", icon_name: "fa icon-java"}
])
puts "Done."
