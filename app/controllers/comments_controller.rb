class CommentsController < ApplicationController
	before_action :logged_in_user
	before_action :user_admin, only: [:edit, :update]

	def edit
		@service = Service.find(params[:service_id])
		@comment = Comment.find(params[:id])
	end

	def create
	    @service = Service.find(params[:service_id])
	    @status_aberto = ServiceStatus.where(status: "ABERTO").first
	    @comment = @service.comments.create(comment_params)
	    errors = ""
	   	if @comment.errors.any?
	   		@comment.errors.full_messages.each do |msg|
            	  errors += msg + ". " 
            end
	   		flash[:danger] = errors
	   	else
	    	@service.update_attribute(:service_status_id, @status_aberto.id)
	    end
	    redirect_to service_path(@service)
	end

	def update
		@service = Service.find(params[:service_id])
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			flash[:success] = "Atualizado"
		else
			flash[:danger] = "Campo não pode ser vazio"
		end
		redirect_to @service
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

    	def user_admin
        	redirect_to services_path unless current_user.admin? 
       	end
end
