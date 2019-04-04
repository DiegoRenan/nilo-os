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

	def last_update(service)
		@last_update = service.updated_at
		service.comments.each do |comment|
			@last_update = comment.updated_at unless @last_update > comment.updated_at
		end
		@last_update
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
