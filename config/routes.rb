Rails.application.routes.draw do 	
	  root 'sessions#new'
  	resources :users
  	resources :areas
    resources :sectors, except: [:create]
  	resources :departments do
  		resources :sectors, except: [:index, :destroy]
  	end
    resources :service_statuses
    resources :service_types
    resources :tools
    resources :comments, only: [:edit, :update]
    resources :services do
      resources :comments
    end
    resources :tool_roles, only: [:destroy, :edit, :update]
    resources :roles  do
      resources :tool_roles
    end
    resources :responsibles
  	get    '/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'

    post '/finalizar_chamado',to: 'services#finalizar_chamado'
    post '/chamado_pendente_aprovacao',to: 'services#chamado_pendente_aprovacao'
    
end
