class UsersController < ApplicationController
	
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

  	private
  		def user_params
  			params.require(:user).permit(:username, :name, :email, :password,
  				:password_confirmation, :picture)
  		end
end
