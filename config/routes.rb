Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'application#home'
  get '/books/trending' => 'books#trending'

  resources :books do
    resources :reviews
  end

  resources :genres
  resources :authors
  resources :reading_lists, only: [:index, :show, :create, :edit, :update,:destroy]

  # nested resource for books
  resources :authors do
    resources :books, only: [:new, :create]
  end

  # nested resource for books
  resources :genres do
    resources :books
  end

  # nested resource for reading_lists
  resources :users, only: [:show] do
    resources :reading_lists, only: [:index, :new, :create, :edit, :update, :destroy]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
