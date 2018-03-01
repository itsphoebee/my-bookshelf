Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'application#home'

  resources :books, only: [:index, :show, :new, :create, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
  resources :authors, only: [:index, :show, :new, :create, :edit, :update]

  # nested resource for books
  resources :authors do
    resources :books
  end

  # nested resource for books
  resources :genres do
    resources :books
  end

  # nested resource for reading_lists
  resources :users, only: [:show] do
    resources :reading_lists, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :reading_lists, only: [:index, :show, :create, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
