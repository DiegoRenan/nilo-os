module ServicesHelper
	def status_aberto
		ServiceStatus.where(status: "ABERTO").first
	end

	def status_fechado
		ServiceStatus.where(status: "FECHADO").first
	end

	def status_aguardando_aprovacao
		ServiceStatus.where(status: "AGUARDANDO APROVAÇÃO").first
	end

	def type_nao_especificado
		ServiceStatus.where(status: "Não especificado").first
	end

	def user_department
		current_user.department
	end

	def user_sector
		current_user.sector
	end
end
