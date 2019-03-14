class ServicesController < ApplicationController
  
  def index
	    if current_user.admin?
        @services = Service.all
      else
        @services = current_user.services.all
        @services += Service.where(user_id: current_user.id)
      end
  end
  
  def new
  	@service = Service.new
  end

  def create
  	@service = Service.new(service_params)

  	if @service.save
    	flash[:success] = "Ordem de serviço #{@service.id} criado"
    	redirect_to @service
	else
		render 'new'
	end
  end

  private

  	def service_params
      params.require(:service).permit(:title, :body, :picture, :department_id, :sector_id, 
        :service_status_id, :service_type_id, :user_id)
    end
end
