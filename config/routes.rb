Rails.application.routes.draw do
  
  get '/phone_numbers' => 'phone_numbers#index', as: 'phone_numbers'
  post '/phone_numbers' => 'phone_numbers#create'
  get '/phone_numbers/new' => 'phone_numbers#new', as: 'new_phone_number'
  get '/phone_numbers/:id/edit' => 'phone_numbers#edit', as: 'edit_phone_number'
  get '/phone_numbers/:id' => 'phone_numbers#show', as: 'phone_number'
  put '/phone_numbers/:id' => 'phone_numbers#update', as: 'update_phone_number'
  patch '/phone_numbers/:id' => 'phone_numbers#update'
  delete '/phone_numbers/:id' => 'phone_numbers#destroy', as: 'destroy_phone_number'

	root to: 'people#index'
  resources :people
  
end