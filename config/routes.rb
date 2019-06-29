Rails.application.routes.draw do
  
  post 'favourite/create'
  delete 'favourite/destroy'
  
  get 'session/new'
  post 'session/create'
  delete 'session/destroy'
  resources :user

  root 'welcome#index'
  
end
