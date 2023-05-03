Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "pages/:user_id/my_bookings", to: "pages#my_bookings", as:"my_bookings"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pokemons do
    resources :bookings
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
