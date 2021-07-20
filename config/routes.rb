Rails.application.routes.draw do
  resources :spices, only: [:index, :show, :create, :update, :destroy]
end
