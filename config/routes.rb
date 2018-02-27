Rails.application.routes.draw do
  resources :reading_lists
  devise_for :users
  resources :books
  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
