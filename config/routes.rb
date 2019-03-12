Rails.application.routes.draw do 	
  get 'departments/new'
	root 'users#index'
  	resources :users
  	resources :departments

  	get    '/login',   to: 'sessions#new'
  	post   '/login',   to: 'sessions#create'
  	delete '/logout',  to: 'sessions#destroy'
end
