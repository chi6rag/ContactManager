Rails.application.routes.draw do
  resources :phone_numbers
	root to: 'people#index'
  resources :people
end