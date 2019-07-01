Rails.application.routes.draw do
  
  post 'favourite/create'
  delete 'favourite/destroy'
  
  get 'session/new'
  post 'session/create'
  delete 'session/destroy'
  resources :user

  get 'page_size', to: 'welcome#page_size', as: 'page_size'
  root 'welcome#index'

	namespace :api do
		namespace :v1 do
			get '/favourite/show' => 'favourite#show'
			get '/favourite/show/:flag/:value' => 'favourite#show'

		end
	end

end
