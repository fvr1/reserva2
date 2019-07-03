Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get '/companies/:id', to: 'companies#show', as: :company
  get '/reservation/:id/done', to: 'reservations#done', as: :done_reservation

  post '/states', to: 'states#create', as: :states

  get '*path' => redirect('/')
end
