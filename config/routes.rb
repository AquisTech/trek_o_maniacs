Rails.application.routes.draw do
  resources :venues
  resources :routes, except: [:new, :create]
  resources :profiles, except: :new
  resources :events
  resources :contacts, except: [:new, :create]
  resources :addresses, except: [:new, :create]
  devise_for :users
  resources :users, except: [:new, :create] do
    collection do
      get :my_account
      patch :update_username
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
