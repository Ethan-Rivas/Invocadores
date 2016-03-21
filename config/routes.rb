Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'frontend#show', as: :authenticated
    end

    namespace :api do
      namespace :v1 do
        resources :users
        resources :lol_versions, path: 'lolversions'
      end
    end

    unauthenticated :user do
      root to: 'devise/sessions#new'
    end
  end
end
