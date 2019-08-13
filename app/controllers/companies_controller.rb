class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :user_admin,   only: [:new, :create, :edit, :update, :destroy]

  def index
  	@companies = Company.all.order('created_at DESC')
  end

  def new
	@company = Company.new
  end

  def show
  end

  def edit
  end

  def create
  	@company = Company.new(company_params)
  	if @company.save
  		flash[:success] = "Empresa #{@company.name} criada"
  		redirect_to @company
  	else
  		render 'new'
  	end
  end

  def update
  	if @company.update(company_params)
  		flash[:success] = "Empresa #{@company.name} atualizada"
  		redirect_to @company
  	else
  		render 'new'
  	end
  end

  def destroy
  	@company.destroy
  	flash[:success] = "Empresa removida"
  	redirect_to companies_path
  end

  private

  	def company_params
  		params.require(:company).permit(:name)
	end

  	def set_company
  		@company = Company.find(params[:id])
  	end

  	def logged_in_user
      unless logged_in?
        flash[:danger] = "Você não está logado."
        redirect_to login_url
      end
    end

    def user_admin
      redirect_to services_path unless current_user.admin? 
    end
end
