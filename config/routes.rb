Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :properties do
        member do
          get '/full_property', to: 'properties#full_property', as: :full_property
        end
      end
      resources :rooms
      resources :items
      resources :receipts
    end
  end
  devise_for :users, controllers: {
    sessions: 'sessions', registrations: 'registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root to: 'devise/sessions#new', as: :unauthenticated_root
end
