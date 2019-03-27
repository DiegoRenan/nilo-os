class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :suport_user,   only: [:new, :create, :edit, :update, :destroy]
  before_action :user_admin

  # GET /tools
  # GET /tools.json
  def index
    @tools = Tool.all.order('created_at DESC')
  end

  # GET /tools/1
  # GET /tools/1.json
  def show
  end

  # GET /tools/new
  def new
    @tool = Tool.new
  end

  # GET /tools/1/edit
  def edit
  end

  # POST /tools
  # POST /tools.json
  def create
    @tool = Tool.new(tool_params)

    if @tool.save
      flash[:success] = "Função #{@tool.name} Criada"
      redirect_to @tool
    else
      render 'new'
    end
  end

  # PATCH/PUT /tools/1
  # PATCH/PUT /tools/1.json
  def update
    if @tool.update(tool_params)
      flash[:success] = "Função #{@tool.name} atualizada"
      redirect_to @tool
    else
      render 'edit'
    end
  end

  # DELETE /tools/1
  # DELETE /tools/1.json
  def destroy
    @tool.destroy
    flash[:success] = "Função deletada"
    redirect_to tools_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:name, :controller)
    end
   
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Você não está logado."
        redirect_to login_url
      end
    end

    def suport_user
      redirect_to(root_url) unless current_user.email == "suporte@suporte.com"
    end

    def user_admin
      redirect_to services_path unless current_user.admin? 
    end
end
