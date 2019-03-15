class ResponsiblesController < ApplicationController
	def create
		@service = Service.find(params[:responsible][:service_id])
		@user = User.find(params[:responsible][:user_id])
		@responsible = Responsible.new(responsible_params)
		if @responsible.save
		 	flash[:success] = "#{@user.name} vinculado."
		 	redirect_to @service
		else
		 	flash[:danger] = "#{@user.name} já esta vinculado a este chamado."
			redirect_to @service
		end
	end

	def destroy
		@responsible = Responsible.find(params[:id])
	 	@service = Service.find(@responsible.service_id)
	 	@responsible.destroy
	   	redirect_to @service
	    flash[:success] = "Usuário desvinculado do chamado"
	end

	private

		def responsible_params
      		params.require(:responsible).permit(:service_id, :user_id)
    	end
end
