Rails.application.routes.draw do
  devise_for :users
  devise_for :participants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
end
