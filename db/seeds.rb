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
             sector_id: Sector.first.id)
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


########################################################################
#                              TOOLS                                   #
########################################################################

if !Tool.exists?(controller: "services")
     Tool.create!(name: "Tickets",
                         controller: "services")
end

if !Tool.exists?(controller: "users")
      Tool.create!(name: "Usuários",
                         controller: "users")
end

if !Tool.exists?(controller: "responsibles")
      Tool.create!(name: "Delegar responsaveis",
                         controller: "responsibles")
end

########################################################################
#                              ROLE                                   #
########################################################################
if !Role.exists?(name: "usuário")
      Role.create!(name: "usuário")
end

########################################################################
#                              TOOL ROLE                               #
########################################################################

@role_id = Role.where(name: "usuário").take.id
@tool_id = Tool.where(controller: "services").take.id

if !ToolRole.exists?(:role_id => @role_id, :tool_id => @tool_id)
      ToolRole.create!(role_id: @role_id,
                       tool_id: @tool_id,
                       criar: true,
                       ler: true,
                       atualizar: false,
                       deletar: false)
end

@tool_id = Tool.where(controller: "responsibles").take.id
if !ToolRole.exists?(:role_id => @role_id, :tool_id => @tool_id)
      ToolRole.create!(role_id: @role_id,
                       tool_id: @tool_id,
                       criar: false,
                       ler: true,
                       atualizar: false,
                       deletar: false)
end
