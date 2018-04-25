Rails.application.routes.draw do
  resources :events, only: [:show, :index]
  authenticate :user do 
    resources :organizers do 
      resources :events
      resources :operators, only: [:new, :create, :show, :destroy, :index]
      get 'statistics', to: 'organizers#statistics', as: :stats
    end
    resources :operators
    resources :doctors do
      resources :events, only: [:index, :show, :register, :unfollow] do
        match 'register' => 'doctors#register', via: :post, as: :register
        match 'unfollow' => 'doctors#unfollow', via: :delete, as: :unfollow
      end
    end
  end

  get 'organizer/statistics', to: 'organizers#statistics', as: :org_events

  authenticate :user do 
    namespace :admin do
      resources :users
      root to: "users#index"
    end
  end

  root to: 'visitors#index'
  devise_scope :user do
    get '/user_exists', to: 'users/sessions#user_exists', as: :user_exists
  end
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
end
