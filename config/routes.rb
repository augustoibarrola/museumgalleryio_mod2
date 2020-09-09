Rails.application.routes.draw do
  resources :user_arts
  resources :comments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'searches#new'
  get '/search', to: 'searches#new'
  post '/search', to: 'searches#show'
end