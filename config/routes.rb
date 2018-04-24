Rails.application.routes.draw do
  devise_for :participants
  resources :participants
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  get 'room_test/index'
  get 'room_test/test'
  resources :test_banks

  root 'room_test#index'
end
