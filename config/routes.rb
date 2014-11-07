Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static_pages#landing'

  resources :properties, only: [:index, :show]

  get 'landing', to: 'static_pages#landing'
  get 'contact', to: 'static_pages#contact'
  post 'email', to: 'static_pages#email'
  
end
