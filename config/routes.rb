Rails.application.routes.draw do
	root 'welcome#index'

	get '/sign_up', to: 'users#new'
	post '/users', to: 'users#create'

	get '/sign_in', to: 'sessions#new'
	post '/sign_in', to: 'sessions#create'
	get '/sign_out', to: 'sessions#destroy'
end
