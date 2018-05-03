Rails.application.routes.draw do
  resources :events, only: [:show, :index]
  #do
  #   match 'search' = >
  # end

  resources :organizers do
    resources :events
    resources :operators, only: [:new, :create, :show, :destroy, :index]
    get 'statistics', to: 'organizers#statistics', as: :stats
    get 'my_events', to: 'organizers#my_events', as: :my_events
  end
  resources :operators
  resources :doctors do
    resources :events, only: [:index, :show], param: :event_id do
      collection do
        get 'available' => 'events#available', as: :available
        get 'registered' => 'events#registered', as: :registered
        get 'archive'  => 'events#archive', as: :archive
      end
      member do
        post 'register' => 'doctors#register', as: :register
        delete 'unfollow' => 'doctors#unfollow',  as: :unfollow
      end
    end
  end

  get 'organizer/statistics', to: 'organizers#statistics', as: :org_events

  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_scope :user do
    get '/user_exists', to: 'users/sessions#user_exists', as: :user_exists
  end


  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
end
