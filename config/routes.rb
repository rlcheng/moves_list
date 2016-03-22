Rails.application.routes.draw do
  get "sign_up", to: "users#new"
  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  get "log_out", to: "sessions#destroy"
  get "games/about"
  get "games/help"
  get "search", to: "search#search"

  root :to => "games#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  shallow do
    resources :games, except: :show do
      resources :characters, except: :show do
        resources :moves, except: :show
      end
    end
  end
end
