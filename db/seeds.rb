# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.create!(first_name: 'admin', last_name: 'istrator', title: 'A', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Employee.create!(first_name: 'jackie', last_name: 'lai', title: 'B', email: 'jack@q', password: 'testing', password_confirmation: 'testing') if Rails.env.development?
Employee.create!(first_name: '123', last_name: '321', title: '0', email: '123@123', password: '123123', password_confirmation: '123123') if Rails.env.development?