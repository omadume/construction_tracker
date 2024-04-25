Rails.application.routes.draw do
  # Removing 'new' and 'edit' routes because this will be simple CRUD with no UI
  resources :daily_snapshots, except: [:new, :edit]
  resources :elements, except: [:new, :edit]
  resources :rooms, except: [:new, :edit]
  resources :buildings, except: [:new, :edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
