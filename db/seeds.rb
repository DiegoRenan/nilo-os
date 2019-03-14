# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !User.exists?(email: 'bill@mail.com')
	User.create!(name:  "Bill Rampson",
             email: "bill@mail.com",
             username: "bill",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
end

if !ServiceStatus.exists?(status: "ABERTO")
	ServiceStatus.create!(status:  "ABERTO")
end

if !ServiceType.exists?(title: "Não específicado")
	ServiceType.create!(title:  "Não específicado")
end