class ServiceTypesController < ApplicationController
  before_action :set_service_type, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :user_admin,   only: [:new, :create, :edit, :update, :destroy]

  def index
  	@service_types = ServiceType.all
  end

  def new
	 @service_type = ServiceType.new
  end

  def show
  end

  def edit
  end

  def create
  	@service_type = ServiceType.new(service_type_params)
  	if @service_type.save
  		flash[:success] = "Tipo #{@service_type.title} criado"
  		redirect_to @service_type
  	else
  		render 'new'
  	end
  end

  def update
  	if @service_type.update(service_type_params)
  		flash[:success] = "Tipo #{@service_type.title} atualizado"
  		redirect_to @service_type
  	else
  		render 'new'
  	end
  end

  def destroy
  	@service_type.destroy
  	flash[:success] = "Tipo removido"
  	redirect_to service_types_path
  end

  private

  	def service_type_params
  		params.require(:service_type).permit(:title)
	end

  	def set_service_type
  		@service_type = ServiceType.find(params[:id])
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
