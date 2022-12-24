Rails.application.routes.draw do


  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'news', to: 'static_pages#news'
  get 'traditions',to: 'static_pages#traditions'

  get 'posts', to: 'posts#index'
  post 'posts', to: 'posts#index'

  resource :session, only: %i[new create destroy]
  resources :posts
  resources :users
  root 'static_pages#home'

  resources :account_activations, only: [:edit]
  resource :password_reset, only: %i[new create edit update]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
