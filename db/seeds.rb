
if !Company.exists?(name: "MATRIZ")
      puts "1 - Creating Company MATRIZ."
	Company.create!(name: "MATRIZ")
end

@company_matriz = Company.where(name: 'MATRIZ').first

if !Department.exists?(name: "ADMINISTRAÇÃO")
      puts "2 - Creating Department ADMINISTRAÇÃO."
	Department.create!(name: "ADMINISTRAÇÃO")
end

@department_administração = Department.where(name: 'ADMINISTRAÇÃO').take

if !Sector.exists?(name: "ADM")
      puts "3 - Creating sector ADM < ADMINISTRAÇÃO"
	Sector.create!(name: "ADM",
				   department_id: @department_administração.id)
end

@sector_adm = Sector.where(name:'ADM').take


########################################################################
#                              ROLE                                   #
########################################################################

if !Role.exists?(name: 'administrador')
      puts "4 - Creating role administrador"
      Role.create!(name: 'administrador')
end

@role_administrador = Role.where(name: 'administrador').first

if !Role.exists?(name: "usuário")
      Role.create!(name: "usuário")
end

if !Role.exists?(name: "técnico")
      Role.create!(name: "técnico")
end

########################################################################
#                              USER ADMIN                              #
########################################################################

if !User.exists?(email: 'adm@minhaempresa.com')
      puts "5 - Creating user Administrador"
	User.create!(name:  "Administrador",
             email: "adm@minhaempresa.com",
             username: "Adm",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             department_id: @department_administração.id,
             sector_id: @sector_adm.id,
             company_id: @company_matriz.id,
             role_id: @role_administrador.id
            )
end

puts "6 - Creating Service status"
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

puts "7 - Creating tools"
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
#                              TOOL ROLE                               #
########################################################################

###### usuário #################
puts "8 - Creating Tool Role"
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

###### técnico #################
@role_id = Role.where(name: "técnico").take.id
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