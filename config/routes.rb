Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }

  root 'dashboard#index'

  namespace :patients do
    resources :doctors, only: %i[index]
    resources :appointments, only: %i[index new create edit update]
  end

  namespace :doctors do
    resources :appointments, only: %i[index edit update]
  end
end
