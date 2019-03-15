class UsersController < ApplicationController
	before_action :logged_in_user
  before_action :correct_user,   only: [:edit, :update]
  before_action :user_admin, only: [:new, :create, :destroy]

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "Usuário #{@user.name} criado."
        redirect_to @user
    else
      	render 'new'
    end
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Usuário #{@user.name} Atualizado"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  		def user_params
  			params.require(:user).permit(:username, :name, :email, :password,
  				:password_confirmation, :picture)
  		end

      def logged_in_user
        unless logged_in?
          flash[:danger] = "Você não está logado."
          redirect_to login_url
        end
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user) || current_user.admin?
      end

      def user_admin
        redirect_to services_path unless current_user.admin? 
      end
end
