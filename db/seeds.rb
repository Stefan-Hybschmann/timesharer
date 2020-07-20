# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Stefan Hybschmann", email: "stefan@stefan.com", password: '123456', phone_number: '+44 12345678')
User.create!(name: "Billy", email: "billy@billy.com", password: '123456', phone_number: '+38 12345679')
User.create!(name: "Jea", email: "jea@jea.com", password: '123456', phone_number: '12345678')

Home.create!(country: 'Denmark', )
