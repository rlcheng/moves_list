Rails.application.routes.draw do
  get "sign_up", to: "users#new"
  get "log_in", to: "sessions#new" 
  post "log_in", to: "sessions#create"
  get "log_out", to: "sessions#destroy"

  root :to => "users#new"

  resources :users
  resources :sessions
  shallow do
    resources :games, except: :show do
      resources :characters, except: [:new, :show] do
        resources :moves, except: [:new, :show]
      end
    end
  end
end
