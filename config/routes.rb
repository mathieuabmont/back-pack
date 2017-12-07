Rails.application.routes.draw do


  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'trips#index'
  resources :trips, except: [:show] do
    resources :steps, only: [:index, :new, :create] do
    end
  end

  resources :steps, only: [:edit, :update, :destroy] do
    resources :transports, only: [:new, :create]
    resources :activities, only: [:new, :create, :index]
    resources :accommodations, only: [:new, :create]
  end


  resources :transports, only: [:edit, :update, :destroy] do
    resources :tickets, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :accommodations, only: [:show, :edit, :update, :destroy]
  resources :activities, only: [:show, :edit, :update, :destroy]
  resources :profils, only: [:show]

end
