module ToolsHelper

	def suport_user?
	   current_user.email == "suporte@suporte.com"
	end

end
