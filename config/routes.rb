Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: [:index]

  delete '/flight/:flight_id/passenger/:passenger_id', to: 'flight_logs#destroy'

  resources :airlines, only: [:show]
end
