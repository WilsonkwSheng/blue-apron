Rails.application.routes.draw do
  get 'braintree/new'
  post 'braintree/checkout'
  
	resources :users, only: [:create, :show, :edit, :update]
	resources :recipes
	root 'welcome#index'

	get '/sign_up', to: 'users#new'
	post '/users', to: 'users#create'

	get '/sign_in', to: 'sessions#new'
	post '/sign_in', to: 'sessions#create'
	delete '/sign_out', to: 'sessions#destroy'

	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
