module ApplicationHelper
	def current_class?(test_path)
        return 'active' if request.path == test_path
        'nav-item'
    end

    def user_allowed?(user, tipo_acesso)
    	controller = controller_name()
    	controller_id = Tool.where(controller: controller).take.id
        if user.role.tool_roles.exists?
    	   return user.role.tool_roles.where(tool_id: controller_id).first[tipo_acesso]
        else
            return false
        end
    end

    def user_allowed_controller?(user, controller, tipo_acesso)
        controller_id = Tool.where(controller: controller).take.id
        if user.role.tool_roles.exists?
            return user.role.tool_roles.where(tool_id: controller_id).first[tipo_acesso]
        else
            return false
        end

    end

    def convert_action_name
    	action = action_name()
    	return 'ler' if action == "show"
    	return 'ler' if action == "index"
    	return 'atualizar' if action == "edit"
    	return 'atualizar' if action == "update"
    	return 'criar' if action == "new"
    	return 'criar' if action == "create"
    	return 'deletar' if action == "destroy"
    end
end
