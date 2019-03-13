class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
  	@areas = Area.all
  end

  def new
  	@area = Area.new
  end

  def edit
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

  def update
  	if @area.update(area_params)
  		flash[:success] = "Area #{@area.name} atualizada"
  		redirect_to @area
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@area.destroy
  	flash[:success] = "Area removida"
  	redirect_to areas_path
  end

  private

  	def area_params
  		params.require(:area).permit(:name)
  	end

  	def set_area
  		@area = Area.find(params[:id])
  	end
end
