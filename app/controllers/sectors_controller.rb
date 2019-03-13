class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :user_admin,   only: [:new, :create, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def new
    @department = Department.find(params[:department_id])
    @sector = Sector.new
  end

  def edit
  end

  def show
  end

  def create
    @department = Department.find(params[:department_id])
    @sector = @department.sectors.build(sector_params)

    if @sector.save
        flash[:success] = "Setor #{@sector.name} criado."
        redirect_to @department
    else
        render 'new'
    end
  end

  def update
    if @sector.update(sector_params)
      flash[:success] = "Setor #{@sector.name} atualizado."
      redirect_to @sector
    else
      render 'new'
    end
  end

  def destroy
    @sector.destroy
    flash[:success] = "Setor deletado."
    redirect_to sectors_path
  end

  private
    def sector_params
      params.require(:sector).permit(:name, :department_id)
    end

    def set_sector
      @sector = Sector.find(params[:id])
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Você não está logado."
        redirect_to login_url
      end
    end

    def user_admin
      redirect_to root_url unless current_user.admin? 
    end
end
