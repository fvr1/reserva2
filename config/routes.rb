Rails.application.routes.draw do
  resources :resources
  resources :companies
  resources :blocks
  resources :states
  resources :reservations
end
