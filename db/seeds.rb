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

User.create(name: "aiueo", email: "admin@test.com", password: "password")
User.create(name: "aiue", email: "satou@test.com", password: "password")
User.create(name: "aiu", email: "suzuki@test.com", password: "password")
User.create(name: "ai", email: "tanaka@test.com", password: "password")
User.create(name: "a", email: "test@test.com", password: "password")
