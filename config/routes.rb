Rails.application.routes.draw do
  resources :reading_lists, only: [:index, :show, :new, :create, :edit, :update]
  devise_for :users
  resources :books, only: [:index, :show, :new, :create, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :edit, :update]
  get '/users/:id', to: 'users#show'

  resources :users, only: [:show] do
  # nested resource for reading_lists
    resources :reading_lists, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
