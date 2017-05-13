Rails.application.routes.draw do
  root to: 'home#index'
  get 'home' => 'users#home'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'select_themes' => 'themes#select_themes'
  post 'follow' => 'themes#follow'
  post 'unfollow' => 'themes#unfollow'

  # Dashboard
  get 'near_dojos' => 'dashboard#near_dojos'
  get 'theme_dojos' => 'dashboard#theme_dojos'
  get 'my_dojos' => 'dashboard#my_dojos'

  resources :videos
  resources :users
  resources :dojos
  resources :themes
  resources :locations
end
