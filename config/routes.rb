Rails.application.routes.draw do
  get '/companies/:id', to: 'companies#show'
  get '/reservation/:id/done', to: 'reservations#done', as: :done_reservation


  post '/states', to: 'states#create', as: :states


  root to: redirect('/companies/1')
end
