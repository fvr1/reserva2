Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get '/companies/:id', to: 'companies#index', as: :company
  get '/companies/:id/edit', to: 'companies#edit', as: :edit_company
  get '/companies/:id/reservations', to: 'companies#show', as: :company_reservations
  get '/reservation/:id/done', to: 'reservations#done', as: :done_reservation

  patch '/companies/:id', to: 'companies#update'
  post '/states', to: 'states#create', as: :states
  post '/blocks', to: 'blocks#create', as: :blocks

  get '*path' => redirect('/')
end
