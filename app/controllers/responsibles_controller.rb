class ResponsiblesController < ApplicationController
	before_action :logged_in_user
	before_action :user_admin

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
