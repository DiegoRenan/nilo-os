class ServiceStatusesController < ApplicationController
  before_action :set_service_status, only: [:show, :edit, :update, :destroy]

  def index
  	@service_statuses = ServiceStatus.all
  end

  def new
	@service_status = ServiceStatus.new
  end

  def show
  end

  def edit
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

  def update
  	if @service_status.update(service_status_params)
  		flash[:success] = "Status #{@service_status.status} atualizado"
  		redirect_to @service_status
  	else
  		render 'new'
  	end
  end

  def destroy
  	@service_status.destroy
  	flash[:success] = "Status removido"
  	redirect_to service_statuses_path
  end

  private

  	def service_status_params
  		params.require(:service_status).permit(:status)
	end

  	def set_service_status
  		@service_status = ServiceStatus.find(params[:id])
  	end

end
