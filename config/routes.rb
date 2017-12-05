Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :trips, except: [:show] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only: [:index, :edit, :update, :destroy]
end
