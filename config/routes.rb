Rails.application.routes.draw do
  
  resources :user

  root 'welcome#index'
  
end
