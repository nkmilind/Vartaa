# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Deletes everything from the database so that you start fresh

# Create the User
puts "Creating user..."
milind = User.create(name: 'Milind', email: 'nk.milind@gmail.com', password: 'zerotheory', admin: true )
gaurang = User.create(name: 'Gaurang', email: 'gaurangkher@gmail.com', password: 'zerotheory', admin: true )