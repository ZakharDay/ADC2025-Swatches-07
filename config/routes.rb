Rails.application.routes.draw do
  devise_for :users

  get   "profile",        to: "profile#my",     as: "my_profile"
  get   "profile/edit",   to: "profile#edit",   as: "edit_profile"
  patch "profile/update", to: "profile#update", as: "update_profile"

  resources :profile, only: [:show]
  resources :comments, only: [:show, :edit, :create, :update, :destroy]

  resources :projects do
    collection do
      get "my"
    end

    resources :swatches do
      # TODO
      resources :colors
    end
  end

  resources :swatches do
    collection do
      get "my"
    end

    member do
      get "fork"
    end
  end
  
  resources :fills do
    collection do
      get "solid"
      get "gradient"
    end
  end

  resources :colors

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :subscriptions, only: :create
      resources :swatches, only: [:index, :show]

      devise_scope :user do
        post "sign_up",          to: "registrations#create"
        get  "authorize_by_jwt", to: "sessions#authorize_by_jwt"
        post "sign_in",          to: "sessions#create"
        post "sign_out",         to: "sessions#destroy"
      end
    end
  end

  namespace :admin do
    resources :subscriptions
    resources :colors
    resources :swatches

    resources :projects do
      resources :swatches do
        resources :colors
      end
    end
    
    resources :fills do
      collection do
        get "solid"
        get "gradient"
      end
    end
  end

  resources :subscriptions, only: :create

  get "welcome/index"
  get "welcome/about"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "welcome#index"
end
