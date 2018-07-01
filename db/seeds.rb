# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

3.times do
  user = User.new(
    email:                    Faker::Internet.unique.email,
    password:                 "password",
    password_confirmation:    "password"
  )
  user.skip_confirmation!
  user.save!
end

1.times do
  user = User.new(
    email:                    'avi@avi.com',
    password:                 "asdfjkl",
    password_confirmation:    "asdfjkl"
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

25.times do
  Application.create!(
    name: Faker::Address.unique.street_name,
    url: Faker::Internet.unique.url,
    user: users.sample
  )
end

applications = Application.all

1500.times do
  Event.create!(
    name: 'event #' + Faker::Number.non_zero_digit,
    application: applications.sample,
    created_at: Faker::Date.backward(14)
  )
end


puts "#{User.count} users created"
puts "#{Application.count} Apps created"
puts "#{Event.count} Events created"
