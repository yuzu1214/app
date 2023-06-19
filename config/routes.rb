Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

  resources :comments, only: [:create, :destroy]

  get 'oimos/top' => 'oimos#top'
  
  get 'oimos/shop_new' => 'oimos#shop_new'

  resources :potatos do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :oimos do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # root 'potatos#top'
  root 'oimos#top'

  resources :tags do
    get 'oimos', to: 'oimos#search'
  end

  

  resources :tags do
    get 'potatos', to: 'potatos#search'
  end




end
