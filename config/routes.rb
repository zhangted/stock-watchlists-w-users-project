Rails.application.routes.draw do

  root 'home#index'

  resources :watchlists
  resources :sessions 
  resources :users
  post 'verify', to: 'sessions#verify', as: 'verify'
  get 'signup', to: 'users#new', as: 'signup'
  get 'resend', to: 'sessions#resend', as: 'resend'
  get 'changeinfo', to: 'users#changeinfo', as: 'changeinfo'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
