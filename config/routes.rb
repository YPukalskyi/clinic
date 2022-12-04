Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'dashboard#index'

  resources :doctors, only: %i[index]

  namespace :patient do
    resources :appointments, only: %i[index new create show edit update]
  end

  namespace :doctor do
    resources :appointments, only: %i[index show edit update]
  end
end
