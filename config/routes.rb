Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :trips, except: [:show] do
    resources :steps, only: [:index, :new, :create] do
    end
  end

  resources :steps, only: [:edit, :update, :destroy] do
    resources :transports, only: [:new, :create, :edit, :update, :show ]
    resources :activities, only: [:new, :create, :edit, :update, :show ]
    resources :accommodations, only: [:new, :create]
  end

  resources :accommodations, only: [:show, :edit, :update, :destroy]
  resources :transports, only: [:destroy]
  resources :activities, only: [:destroy]
end
