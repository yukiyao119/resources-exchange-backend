Rails.application.routes.draw do
  root 'users#index'

  resources :messages
  resources :reviews
  # resources :user_skill_exchanges
  resources :exchanges
  resources :user_skills
  resources :skills
  resources :users

  post '/login', to: 'auth#login'
  get '/profile', to: 'users#profile'
  # post '/signup', to: 'users#create'

  match '*_missing_page', to: 'users#profile', via: :get

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
