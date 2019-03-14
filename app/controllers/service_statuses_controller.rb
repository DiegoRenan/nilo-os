class ServiceStatusesController < ApplicationController
  before_action :set_service_status, only: [:show, :edit, :update, :destroy]

  def new
	@service_status = ServiceStatus.new
  end

  def show
  end

  def create
  	@service_status = ServiceStatus.new(service_status_params)
  	if @service_status.save
  		flash[:success] = "Status #{@service_status.status} criado"
  		redirect_to @service_status
  	else
  		render 'new'
  	end
  end

  private

  	def service_status_params
  		params.require(:service_status).permit(:status)
	end
	
  	def set_service_status
  		@service_status = ServiceStatus.find(params[:id])
  	end

end
