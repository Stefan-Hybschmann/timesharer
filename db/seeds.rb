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
User.create!(name: "Billy", email: "billy@billy.com", password: '123456', phone_number: '+852 87654321')
User.create!(name: "Jea", email: "jea@jea.com", password: '123456', phone_number: '12345678')
User.create!(name: "Juljan", email: "juljan@juljan.com", password: '123456', phone_number: '987654321')


puts "Creating new homes seeds"
Home.create!(home_name: 'The Little Mermaid', country: 'Denmark', city: 'Copenhagen', address: 'Nyhavn 45, 1051', maximum_no_of_guest: 10, no_of_bed: 10)
Home.create!(home_name: 'The Dark Forest', country: 'Germany', city: 'Berlin', address: 'Colomierstraße 3, 14109', maximum_no_of_guest: 8, no_of_bed: 8)
Home.create!(home_name: 'Cielo y Mar', country: 'Spain', city: 'Barcelona', address: 'Passeig de Garcia Faria, 49, 08019', maximum_no_of_guest: 12, no_of_bed: 10)


puts "Creating new bookings seeds"
Booking.create!(user: User.first, home: Home.first, start_date: "2020-07-29", end_date: "2020-08-05", no_of_guest: 6)
Booking.create!(user: User.first, home: Home.first, start_date: "2021-06-30", end_date: "2021-07-28", no_of_guest: 4)
Booking.create!(user: User.second, home: Home.first, start_date: "2020-08-10", end_date: "2020-08-18", no_of_guest: 4)
Booking.create!(user: User.last, home: Home.first, start_date: "2020-08-22", end_date: "2020-09-04", no_of_guest: 4)
Booking.create!(user: User.second, home: Home.second, start_date: "2020-09-12", end_date: "2020-10-04", no_of_guest: 3)
Booking.create!(user: User.third, home: Home.second, start_date: "2020-07-31", end_date: "2020-08-06", no_of_guest: 6)
Booking.create!(user: User.first, home: Home.third, start_date: "2020-09-05", end_date: "2020-09-11", no_of_guest: 2)
Booking.create!(user: User.last, home: Home.third, start_date: "2020-10-10", end_date: "2020-10-11", no_of_guest: 4)


puts "Creating new ownerships seeds"
Ownership.create!(user: User.first, home: Home.first, shares_of_ownership: 50, is_admin: true)
Ownership.create!(user: User.second, home: Home.first, shares_of_ownership: 30, is_admin: true)
Ownership.create!(user: User.last, home: Home.first, shares_of_ownership: 20, is_admin: true)
Ownership.create!(user: User.second, home: Home.second, shares_of_ownership: 50, is_admin: true)
Ownership.create!(user: User.third, home: Home.second, shares_of_ownership: 50, is_admin: false)
Ownership.create!(user: User.first, home: Home.third, shares_of_ownership: 25, is_admin: true)
Ownership.create!(user: User.third, home: Home.third, shares_of_ownership: 35, is_admin: false)
Ownership.create!(user: User.last, home: Home.third, shares_of_ownership: 40, is_admin: true)
