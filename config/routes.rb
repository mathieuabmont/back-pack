Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips, except: [:show] do
    resources :steps, except: [:show]
  end
end
