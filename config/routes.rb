Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'application#home'

  resources :reading_lists, only: [:index, :show, :new, :create, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
  resources :authors, only: [:index, :show, :new, :create, :edit, :update]

  resources :authors do
    resources :books, only: [:new, :create]
  end

  resources :books, only:[:show] do
    resources :reading_lists, only:[:new, :create, :edit, :update]
  end

  resources :users, only: [:show] do
  # nested resource for reading_lists
    resources :reading_lists, only: [:show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
