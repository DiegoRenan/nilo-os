class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

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

  private
    def sector_params
      params.require(:sector).permit(:name, :department_id)
    end

    def set_sector
      @sector = Sector.find(params[:id])
    end

end
