Rails.application.routes.draw do
  root 'session#login'
  resources :users

  get 'palindromes/view'
  get 'input', to: 'palindromes#input'

  post 'authorize', to: "session#authorize"
  get 'logout', to: "session#logout"
  get 'login', to: "session#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
