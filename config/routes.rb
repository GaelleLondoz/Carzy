Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'

  resources :vehicules do
    resources :bookings, only: [:new, :create, :update, :destroy]
    resources :reviews, only: [ :new, :create ]
  end
  get '/profile', to: 'pages#profile'
  get "vehicules/:id/reviews", to: "vehicules#show"

  # delete '/bookings', to: 'bookings#destroy', as: :destroy

  # delete "/vehicules/", to: "vehicules#destroy", as: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
