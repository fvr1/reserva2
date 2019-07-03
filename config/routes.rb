Rails.application.routes.draw do
  get '/company/:id', to: 'companies#index'
  get '/company/:id/reservations', to: 'companies#show'
  get '/company', to: 'companies#new', as: :create_company_path
  get '/reservation/:id/done', to: 'reservations#done', as: :done_reservation

  post '/states', to: 'states#create', as: :states
  post '/blocks', to: 'blocks#create', as: :blocks

  root to: redirect('/company/1')
end
