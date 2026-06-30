Rails.application.routes.draw do
  devise_for :users
  resources :dealerships, only: %i[index show]
  resources :cars
  root "dealerships#index"
end
