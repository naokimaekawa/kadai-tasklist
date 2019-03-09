Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #ログイン関連
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # get 'toppages/index'
  
  root to: 'tasks#index'

  resources :tasks
  
  # user関連
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
end
