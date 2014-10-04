Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static_pages#landing'

  resources :properties, only: [:index, :show]

  scope :static_pages do
    get :landing, to: 'static_pages#landing'
  end
  
end
