Rails.application.routes.draw do
  resources :persons
  root 'home#index'
end
