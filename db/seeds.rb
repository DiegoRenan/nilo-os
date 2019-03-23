# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !Department.exists?(name: "ADMINISTRADOR")
	Department.create!(name: "ADMINISTRADOR")
end

if !Sector.exists?(name: "ADMINISTRADOR")
	Sector.create!(name: "ADMINISTRADOR",
				   department_id: 1)
end

if !User.exists?(email: 'suporte@suporte.com')
	User.create!(name:  "Suporte",
             email: "suporte@suporte.com",
             username: "suporte",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             department_id: 1,
             sector_id: 1)
end

if !ServiceStatus.exists?(status: "ABERTO")
	ServiceStatus.create!(status:  "ABERTO")
end

if !ServiceStatus.exists?(status: "FECHADO")
      ServiceStatus.create!(status:  "FECHADO")
end

if !ServiceStatus.exists?(status: "AGUARDANDO APROVAÇÃO")
      ServiceStatus.create!(status:  "AGUARDANDO APROVAÇÃO")
end

if !ServiceType.exists?(title: "Não específicado")
	ServiceType.create!(title:  "Não específicado")
end