class ToolRolesController < ApplicationController
	before_action :logged_in_user
	before_action :user_admin

	def edit
		@tool_role = ToolRole.find(params[:id])
	end

	def create
		@role = Role.find(params[:role_id])
		@tool_role = @role.tool_roles.build(tool_roles_params)
		if @tool_role.save
		 	flash[:success] = "Permissões salva."
		 	redirect_to @role
		else
		 	flash[:danger] = "Permissão já adicionada"
			redirect_to @role
		end
	end

	def update
		@tool_role = ToolRole.find(params[:id])

		if @tool_role.update(tool_roles_params)
			flash[:success] = "Permissões atualizadas"
			redirect_to @tool_role.role
		else
			flash[:danger] = "Permissões não podem ser atualizadas"
			redirect_to @tool_role
		end
	end

	def destroy
		@role = Role.find(params[:role_id])
		@tool_role = ToolRole.find(params[:id])
		@tool_role.destroy
		flash[:success] = "Permissões removidas."
		redirect_to @role
	end

	private

		def tool_roles_params
      		params.require(:tool_role).permit(:tool_id, :criar, :ler, :atualizar, :deletar)
    	end

    	def logged_in_user
	      unless logged_in?
	        flash[:danger] = "Você não está logado."
	        redirect_to login_url
	      end
	    end

	    def user_admin
	      redirect_to services_path unless current_user.admin? 
	    end
end
