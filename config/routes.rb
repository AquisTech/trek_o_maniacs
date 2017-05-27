Rails.application.routes.draw do
  resources :events
  resources :contacts
  resources :addresses
  resources :users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
