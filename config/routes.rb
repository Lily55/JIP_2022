Rails.application.routes.draw do
  root 'session#login'
  resources :users
  get 'palindromes/input'
  get 'palindromes/view'
  post 'authorize', to: "session#authorize"
  get 'logout', to: "session#logout"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
