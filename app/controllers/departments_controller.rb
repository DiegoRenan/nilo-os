class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
  	@departments = Department.all
  end

  def new
  	@department = Department.new
  end

  def edit
  end

  def show
  end

  def create
    @department = Department.new(department_params)

    if @department.save
	    flash[:success] = "Departamento #{@department.name} criado."
    	redirect_to @department
	  else
       render 'new'
    end
  end

  def update
      if @department.update(department_params)
        flash[:success] = "Departamento #{@department.name} atualizado."
        redirect_to @department
      else
        render 'edit'
      end
  end

  def destroy
    @department.destroy
    flash[:success] = "Departamento deletado."
    redirect_to departments_path
  end

  private
  	def set_department
      @department = Department.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name)
    end

end
