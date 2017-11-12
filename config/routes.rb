Rails.application.routes.draw do
  resources :workshops
  # Registration temporary disabled
  devise_for :users, :skip => :registration
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "repairs#index"

  resources :repairs
end
