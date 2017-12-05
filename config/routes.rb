Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, except: [:show] do
    resources :steps, only: [:new, :create] do
      resources :transports, only: [:new, :create]
    end
  end
  resources :steps, only: [:index, :edit, :update, :destroy]
  resources :transports, only: [:show, :edit, :update, :destroy]
end
