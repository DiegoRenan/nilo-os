class CommentsController < ApplicationController
	before_action :logged_in_user

	def create
	    @service = Service.find(params[:service_id])
	    @status_aberto = ServiceStatus.where(status: "ABERTO").first
	    @service.update_attribute(:service_status_id, @status_aberto.id)
	    @comment = @service.comments.create(comment_params)
	    redirect_to service_path(@service)
	end

	private
	    def comment_params
	      params.require(:comment).permit(:user_id, :body, :picture)
	    end

	    def logged_in_user
      		unless logged_in?
        		flash[:danger] = "Você não está logado."
        		redirect_to login_url
      		end
    	end
end