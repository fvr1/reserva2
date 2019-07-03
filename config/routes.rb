Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get '/companies/:id', to: 'companies#index'
  get '/companies/:id/reservations', to: 'companies#show',  as: :company
  get '/companies', to: 'companies#new', as: :create_company_path
  get '/reservation/:id/done', to: 'reservations#done', as: :done_reservation

  post '/states', to: 'states#create', as: :states
  post '/blocks', to: 'blocks#create', as: :blocks

  get '*path' => redirect('/')
end
