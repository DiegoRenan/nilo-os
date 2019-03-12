class DepartmentsController < ApplicationController
  def new
  	@department = Department.new
  end
end
