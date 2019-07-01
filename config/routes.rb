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
			get '/favourites/show' => 'favourite#show'
			get '/favourites/show/:flag/:value' => 'favourite#show'
      post '/favourite/create/:flag/:value' => 'favourite#create'
      delete '/favourite/destroy/:flag/:value' => 'favourite#destroy'

      get '/numbers/show/' => 'number#index'
      get '/numbers/show/page/:page' => 'number#index'
      get '/numbers/show/size/:size' => 'number#index'
      get '/numbers/show/page/:page/size/:size' => 'number#index'
      get '/number/show/:flag/:value' => 'number#show'

      get '/session/show/' => 'session#show'
      post '/session/create/:flag/:value' => 'session#create'
      delete '/session/destroy/' => 'session#destroy'

      get 'users/show' => 'user#show'
      get 'user/show/:flag/:value' => 'user#show'
      post 'user/create' => 'user#create'
      post 'user/create/:flag/:value' => 'user#create'
      delete 'user/destroy/:flag/:value' => 'user#destroy'
		end
	end

end