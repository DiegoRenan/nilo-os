class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :user_admin, only: [:new, :create, :destroy]
  before_action :logged_in_user

  def index
    @roles = Role.all.order('created_at DESC')
  end

  def show
    @tools = Tool.all.where.not(id: vinculados(@role))
  end

  def new
    @role = Role.new
  end

  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    if @role.save
      flash[:success] = "Função #{@role.name} criada."
      redirect_to @role
    else
      render 'new'
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if @role.update(role_params)
      flash[:success] = "Função #{@role.name} atualizada."
      redirect_to @role
    else
      render 'new'
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    flash[:success] = "Função deletada"
    redirect_to roles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name)
    end

    def user_admin
      redirect_to services_path unless current_user.admin? 
    end
    
    def logged_in_user
        unless logged_in?
          flash[:danger] = "Você não está logado."
          redirect_to login_url
        end
    end

    def vinculados(role)
        vinculados = []
        tool_roles = role.tool_roles
        tool_roles.each do |tool_role|
           vinculados.append(tool_role.tool_id)
        end
        vinculados
    end
end
