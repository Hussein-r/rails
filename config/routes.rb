Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # crud operations on articles create, read, update, and destroy item
  
  resources :articles do
    resources :comments
  end

  # Home page (routing) => root 
  root 'welcome#index'
end
