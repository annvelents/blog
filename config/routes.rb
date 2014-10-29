Rails.application.routes.draw do
  devise_for :users
  get 'persons/profile'

  resources :articles do 
    resources :comments
  end
  root 'welcome#index'
  get 'persons/profile', as: 'user_root'
end
