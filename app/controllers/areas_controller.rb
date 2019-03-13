class AreasController < ApplicationController
  before_action :set_area, only: [:show]

  def index
  	@areas = Area.all
  end

  def new
  	@area = Area.new
  end

  def show
  end

  def create
  	@area = Area.new(area_params)
  	if @area.save
  		flash[:success] = "Area #{@area.name} criada"
  		redirect_to @area
  	else
  		render 'new'
  	end
  end

  private

  	def area_params
  		params.require(:area).permit(:name)
  	end

  	def set_area
  		@area = Area.find(params[:id])
  	end
end
