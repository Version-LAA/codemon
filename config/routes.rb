Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/my-bookings', to: 'bookings#my_bookings', as: :my_bookings
  patch '/my-bookings/:id', to: 'bookings#update_booking_status', as: :approval_bookings
  delete '/bookings/:id', to: 'bookings#cancel_booking', as: :cancel_booking

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pokemons do
    resources :bookings, only: %i[create new]
  end

  resources :bookings, only: %i[update edit]

  # Defines the root path route ("/")
  # root "articles#index"
end
