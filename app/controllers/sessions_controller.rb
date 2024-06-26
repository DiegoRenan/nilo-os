class SessionsController < ApplicationController
	layout 'applogin'
  	def new
  	end

  	def create
	  	user = User.find_by(email: params[:session][:email].downcase)
	    if user && user.authenticate(params[:session][:password])
	      log_in user
	      redirect_to services_path
	    else
	      flash.now[:danger] = 'Combinação email/senha invalida'
	      render 'new'
	    end
  	end

  	def destroy
    	log_out
    	redirect_to root_url
  	end
end
