ReservationSystem::Application.routes.draw do
  resources :flights
  root  'static_pages#home'
  match '/search',  to: 'flights#new',            via: 'get'
  match '/results', to: 'flights#results',        via: 'get'
  match '/wait',    to: 'flights#wait',           via: 'get'

end
