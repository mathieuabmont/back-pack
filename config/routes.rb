Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, except: [:show] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only: [:index, :edit, :update, :destroy]
end
