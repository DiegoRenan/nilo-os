class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  
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

  def show
    @responsible = Responsible.new
    @users = User.all.where.not(id: vinculados(@service))
  end

  def edit
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

  def update
    if @service.update(service_params)
      flash[:success] = "Ordem de serviço #{@service.id} atualizada"
      redirect_to @service
    else
      render 'edit'
    end
  end

  def destroy
    @service.destroy
    flash[:success] = "Ordem de Serviço deletada"
    redirect_to services_path
  end
  
  private

  	def service_params
      params.require(:service).permit(:title, :body, :picture, :department_id, :sector_id, 
        :service_status_id, :service_type_id, :user_id)
    end

    def set_service
      @service = Service.find(params[:id])
    end

    def vinculados(service)
        users = []
        responsibles = service.responsibles
        responsibles.each do |responsible|
           users.append(responsible.user_id)
        end
        users
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Você não está logado."
        redirect_to login_url
      end
    end
end
