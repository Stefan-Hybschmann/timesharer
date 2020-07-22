# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting all users"
puts "Deleting all ownerships"
puts "Deleting all homes"
puts "Deleting all bookings"

Ownership.delete_all
Booking.delete_all
Home.delete_all
User.delete_all

puts "All ownerships have been deleted"
puts "All bookings have been deleted"
puts "All homes have been deleted"
puts "All users have been deleted"

puts "Creating new user seeds"
User.create!(name: "Stefan Hybschmann", email: "stefan@stefan.com", password: '123456', phone_number: '+44 12345678')
User.create!(name: "Billy", email: "billy@billy.com", password: '123456', phone_number: '+38 12345679')
User.create!(name: "Jea", email: "jea@jea.com", password: '123456', phone_number: '12345678')


puts "Creating new homes seeds"
Home.create!(country: 'Denmark', address: 'Copenhagen', maximum_no_of_guest: 8, no_of_bed: 10)
Home.create!(country: 'Germany', address: 'Berlin', maximum_no_of_guest: 10, no_of_bed: 10)
Home.create!(country: 'Spain', address: 'Madrid', maximum_no_of_guest: 4, no_of_bed: 10)


puts "Creating new bookings seeds"
Booking.create!(user: User.first, home: Home.first, start_date: "2020-10-10", end_date: "2020-11-10", no_of_guest: 6)
Booking.create!(user: User.first, home: Home.second, start_date: "2021-10-10", end_date: "2021-12-10", no_of_guest: 4)
Booking.create!(user: User.last, home: Home.third, start_date: "2022-10-10", end_date: "2022-10-11", no_of_guest: 2)


puts "Creating new ownerships seeds"
Ownership.create!(user: User.first, home: Home.first, shares_of_ownership: 30, is_admin: true)
Ownership.create!(user: User.first, home: Home.second, shares_of_ownership: 30, is_admin: true)
Ownership.create!(user: User.last, home: Home.third, shares_of_ownership: 30, is_admin: true)
