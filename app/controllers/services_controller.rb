class ServicesController < ApplicationController
  include ServicesHelper
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :user_admin, only: [:edit, :update, :destroy]

  def index
	    if current_user.admin? || current_user.role.name == "master"
        @services = Service.all.order('id DESC')
      else
        @services = current_user.services.all
        @services += Service.where(user_id: current_user.id).all.where.not(id: @services).where(department_id: current_user.department_id).sort_by{|id|}.reverse
      end
  end
  
  def new
  	@service = Service.new
    @service_attachment = @service.service_attachments.build
  end

  def show
    @responsible = Responsible.new
    @service_attachments = @service.service_attachments.all
    @users = User.all.where.not(id: vinculados(@service)).reject {|user| user.email == "suporte@suporte.com"} || Users.all
  end

  def edit
    @responsible = Responsible.new
    @users = User.all.where.not(id: vinculados(@service)).reject {|user| user.email == "suporte@suporte.com"}
  end

  def create
  	@service = Service.new(service_params)
    @users = User.all.where.not(id: vinculados(@service)).reject {|user| user.email == "suporte@suporte.com"}
  	if @service.save
      params[:service_attachments]['picture'].each do |a|
          @service_attachment = @service.service_attachments.create!(:picture => a, :service_id => @service.id)
      end
    	flash[:success] = "Ordem de serviço #{@service.id} criado"
    	redirect_to @service
  	else
  		render 'new'
  	end
  end

  def update
    @users = User.all.where.not(id: vinculados(@service)).reject {|user| user.email == "suporte@suporte.com"}
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

  def finalizar_chamado
    @status_fechado = ServiceStatus.where(status: "FECHADO").first
    @status_avaliando = ServiceStatus.where(status: "AGUARDANDO APROVAÇÃO").first
    @service = Service.find(params[:value])
    
    if current_user.admin?
      @service.update_attribute(:service_status_id, @status_fechado.id)
      flash[:success] = "Ordem de serviço #{@service.id} FECHADO"
    else
      @service.update_attribute(:service_status_id, @status_avaliando.id)
      flash[:success] = "Ordem de serviço #{@service.id} AGUARDANDO APROVAÇÃO"
    end
    
    redirect_to @service
  end

  def my_services
    if current_user.admin? || user_tecnico? || user_allowed?(current_user, "atualizar")
      @services = current_user.services.all
      @services += Service.where(user_id: current_user.id).all.where.not(id: @services)
    else
      @services = Service.where(user_id: current_user.id).all
    end
    @services = @services.sort_by{|id|}.reverse
  end

  def opened_services
    if current_user.admin? || user_tecnico? || user_allowed?(current_user, "atualizar")
      @services = Service.where(service_status_id: status_aberto.id).all
    else
       @services = current_user.services.where(service_status_id: status_aberto.id).all
       @services += Service.where(user_id: current_user.id, service_status_id: status_aberto.id).all.where.not(id: @services)
    end
    @services = @services.sort_by{|id|}.reverse
  end

  def closed_services
    if current_user.admin? || user_tecnico? || user_allowed?(current_user, "atualizar")
      @services = Service.where(service_status_id: status_fechado.id).all
    else
      @services = current_user.services.where(service_status_id: status_fechado.id).all
      @services += Service.where(user_id: current_user.id, service_status_id: status_fechado.id).all.where.not(id: @services)
    end
    @services = @services.sort_by{|id|}.reverse
  end

  def waiting_services
    if current_user.admin? || user_tecnico? || user_allowed?(current_user, "atualizar")
      @services = Service.where(service_status_id: status_aguardando_aprovacao.id).all
    else
      @services = current_user.services.where(service_status_id: status_aguardando_aprovacao.id).all
      @services += Service.where(user_id: current_user.id, service_status_id: status_aguardando_aprovacao.id).all.where.not(id: @services)
    end
    @services = @services.sort_by{|id|}.reverse
  end
  
  private

  	def service_params
      params.require(:service).permit(:title, :body, :picture, :department_id, :sector_id, 
        :service_status_id, :service_type_id, :user_id, :company_id, service_attachments_attributes: 
        [:id, :service_id, :picture])
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

    def user_admin
        redirect_to services_path unless current_user.admin? || user_allowed?(current_user, convert_action_name)
    end

end
