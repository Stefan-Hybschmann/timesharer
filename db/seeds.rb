# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
"Deleting all users"
User.delete_all
"All users have been deleted"
"Creating new user seeds"
User.create!(name: "Stefan Hybschmann", email: "stefan@stefan.com", password: '123456', phone_number: '+44 12345678')
User.create!(name: "Billy", email: "billy@billy.com", password: '123456', phone_number: '+38 12345679')
User.create!(name: "Jea", email: "jea@jea.com", password: '123456', phone_number: '12345678')


"Deleting all homes"
Home.delete_all
"All homes have been deleted"
"Creating new homes seeds"
Home.create!(country: 'Denmark', address: 'Copenhagen', maximum_no_of_guest: 8)
Home.create!(country: 'Germany', address: 'Berlin', maximum_no_of_guest: 10)
Home.create!(country: 'Spain', address: 'Madrid', maximum_no_of_guest: 4)

"Deleting all bookings"
Booking.delete_all
"All bookings have been deleted"
"Creating new bookings seeds"
Booking.create!(start_date: "20/07/2020", end_date: "27/07/2020", no_of_guest: 6)
Booking.create!(start_date: "20/08/2020", end_date: "27/08/2020", no_of_guest: 4)
Booking.create!(start_date: "20/09/2020", end_date: "27/09/2020", no_of_guest: 2)

"Deleting all ownerships"
Ownership.delete_all
"All ownerships have been deleted"
"Creating new ownerships seeds"
Ownership.create!(user_id: 1, home_id: 1, shares_of_ownership: 30, is_admin: true)
Ownership.create!(user_id: 2, home_id: 2, shares_of_ownership: 30, is_admin: true)
Ownership.create!(user_id: 3, home_id: 3, shares_of_ownership: 30, is_admin: true)
