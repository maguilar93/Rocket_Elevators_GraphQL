# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Employee.create!(email: 'jack@q', password: 'testing', password_confirmation: 'testing') if Rails.env.development?
Employee.create!(email: '123@123', password: '123123', password_confirmation: '123123') if Rails.env.development?