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
    resources :services
    resources :responsibles
  	get    '/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'
end
