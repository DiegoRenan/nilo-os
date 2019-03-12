class DepartmentsController < ApplicationController
  def new
  	@department = Department.new
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

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name)
    end

end
