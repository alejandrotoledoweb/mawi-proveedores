Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trabajos, only: %i[create index]
  
  resources :proveedors, only: %i[create index]
  resources :appointments, only: %i[create index]

  get '/proveedores/:id/espacio/:date/:hour', to: 'appointments#espacio'
  get '/proveedores/free/:date', to: 'appointments#disponibles'
  get '/appointments/proveedores/:id', to: 'appointments#allAppointments'
  get '/proveedores/:id/total_hours/:date', to: 'appointments#hours'
end
