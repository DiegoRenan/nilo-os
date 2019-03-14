module ServicesHelper
	def status_aberto
		ServiceStatus.where(status: "ABERTO").first
	end

	def type_nao_especificado
		ServiceStatus.where(status: "Não especificado").first
	end
end
