Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trabajos
  
  resources :proveedors
  resources :appointments

  get '/proveedor/:id/espacio/:date/:hour', to: 'appointments#espacio'
end
