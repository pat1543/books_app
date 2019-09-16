# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  Book.create(
    title: Faker::Name.name_with_middle,
    memo: Faker::Name.name_with_middle,
    author: Faker::Name.name_with_middle
  )
end

50.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    postal_code: Faker::Address.postcode,
    address: Faker::Address.city,
    introduction: Faker::Lorem.sentence,
    password: "password"
  )
  user.save!
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.books.create!(title: Faker::Name.name_with_middle, memo: content, author: Faker::Name.name_with_middle) }
end
