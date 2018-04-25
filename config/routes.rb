Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'application#home'
  get '/books/trending' => 'books#trending'

  resources :genres
  resources :reading_lists, only: [:index, :show]

  # nested resource for books
  resources :authors do
    resources :books, only: [:new, :create]
  end

  # nested resource for reviews
  resources :books do
    resources :reviews
  end

  # nested resource for reading_lists
  resources :users do
    resources :reading_lists
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
