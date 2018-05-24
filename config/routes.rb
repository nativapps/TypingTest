Rails.application.routes.draw do
  as :participant do
    patch '/participant/confirmation' => 'confirmations#update', :via => :put, :as => :update_participant_confirmation
  end
  devise_for :participants, :controllers => { :confirmations => "confirmations" }

  resources :participants
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  get 'room_test/index'
  get 'room_test/test'
  get 'room_test/lobby'
  get 'room_test/rooms'
  post 'room_test/test', to: "reports#create"
  # patch 'room_test/test', to: "reports#update"

  resources :test_banks

  resources :reports
  # post 'report/create'

  root 'room_test#index'

  # Send email
  get :send_invitation, to: 'rooms#send_invitation', as: :send_invitation
end
