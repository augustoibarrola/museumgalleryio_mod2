Rails.application.routes.draw do
  resources :user_arts
  resources :comments
  resources :users

  get '/view_other/:id', to: 'users#viewother', as: 'view_other'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'searches#new'
  get '/search', to: 'searches#new'
  post '/search', to: 'searches#show'

  delete '/logout', to: 'sessions#logout', as: 'logout'
  post '/login', to: 'sessions#login', as: 'login'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
end

