Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :posts do
    resources :comments, except: [ :index, :show ]
  end

  resources :users, only: [ :show ]
  resources :friend_requests, only: [ :create, :update, :destroy ]

  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
