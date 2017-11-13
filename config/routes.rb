Rails.application.routes.draw do
  # Registration temporary disabled
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "workshops#index"

  resources :workshops
  resources :items
  resources :repairs
end
