Rails.application.routes.draw do
  resources :contact, only: [ :new, :create ]

  devise_for :users
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "reports#new"
end
