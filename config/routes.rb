Rails.application.routes.draw do
  resources :events
  resources :organizers do
    resources :events do
    end
  end
  resources :operators
  resources :doctors do
    resources :events, only: [:index, :show, :register, :unfollow] do
      match 'register' => 'doctors#register', via: :post, as: :register
      match 'unregister' => 'doctors#unregister', via: :delete, as: :unregister
    end
  end
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
end
