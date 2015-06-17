Rails.application.routes.draw do
  
  get '/phone_numbers' => 'phone_numbers#index', as: 'phone_numbers'
  post '/phone_numbers' => 'phone_numbers#create'
  get '/phone_numbers/new' => 'phone_numbers#new', as: 'new_phone_number'
  get '/phone_numbers/:id/edit' => 'phone_numbers#edit', as: 'edit_phone_number'
  get '/phone_numbers/:id' => 'phone_numbers#show', as: 'phone_number'
  put '/phone_numbers/:id' => 'phone_numbers#update', as: 'update_phone_number'
  patch '/phone_numbers/:id' => 'phone_numbers#update'
  delete '/phone_numbers/:id' => 'phone_numbers#destroy', as: 'destroy_phone_number'

  get '/email_addresses' => 'email_addresses#index', as: 'email_addresses'
  post '/email_addresses' => 'email_addresses#create'
  get '/email_addresses/new' => 'email_addresses#new', as: 'new_email_address'
  get '/email_addresses/:id/edit' => 'email_addresses#edit', as: 'edit_email_address'
  get '/email_addresses/:id' => 'email_addresses#show', as: 'email_address'
  put '/email_addresses/:id' => 'email_addresses#update', as: 'update_email_address'
  patch '/email_addresses/:id' => 'email_addresses#update'
  delete '/email_addresses/:id' => 'email_addresses#destroy', as: 'destroy_email_address'

	root to: 'people#index'
  resources :people
  
end