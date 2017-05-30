Rails.application.routes.draw do
  resources :venues
  resources :routes
  resources :profiles
  resources :events
  resources :contacts
  resources :addresses
  devise_for :users
  resources :users, except: [:new, :create] do
    collection do
      get :my_account
      patch :update_username
      patch :update_password
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
