Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, only:[:show, :new, :create] do
    member do
      get :likes
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'search', to: 'prefectures#index'
  resources :prefectures, only:[:show]
  
  resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
end
