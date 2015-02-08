Rails.application.routes.draw do
  resources :shops

  root to: 'visitors#index'
end
