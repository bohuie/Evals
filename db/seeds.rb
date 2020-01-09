# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([
    {first_name: "admin", last_name: "user", email: "admin@localhost.com", password: "adminpassword", password_confirmation: "adminpassword", admin: true},
    {first_name: "user", last_name: "one", email: "user.one@localhost.com", password: "useronepassword", password_confirmation: "useronepassword", admin: false},
    {first_name: "user", last_name: "two", email: "user.two@localhost.com", password: "usertwopassword", password_confirmation: "usertwopassword", admin: false},
    {first_name: "client", last_name: "one", email: "client.one@localhost.com", password: "clientonepassword", password_confirmation: "clientonepassword", admin: false, client: true},
    {first_name: "client", last_name: "two", email: "client.two@localhost.com", password: "clienttwopassword", password_confirmation: "clienttwopassword", admin: false, client: true},
  ])