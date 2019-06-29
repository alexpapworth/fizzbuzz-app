Rails.application.routes.draw do
  
  get 'session/new'
  post 'session/create'
  delete 'session/destroy'
  resources :user

  root 'welcome#index'
  
end
