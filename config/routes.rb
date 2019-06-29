Rails.application.routes.draw do
  
  get 'session/destroy'
  resources :user

  root 'welcome#index'
  
end
