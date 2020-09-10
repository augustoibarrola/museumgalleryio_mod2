Rails.application.routes.draw do
  resources :user_arts
  resources :comments
  resources :users

  get '/discover', to: 'user_arts#discover'
  get '/discovery', to: 'user_arts#logged_discover'

  get '/view_other/:id', to: 'users#viewother', as: 'view_other'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'searches#new'
  get '/search', to: 'searches#new'
  post '/search', to: 'searches#show'

  get '/user_search', to: 'searches#usernew'
  post '/user_search', to: 'searches#usershow'
  

  delete '/logout', to: 'sessions#logout', as: 'logout'
  post '/login', to: 'sessions#login', as: 'login'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
end

