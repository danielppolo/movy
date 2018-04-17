Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :bikes do
    resources :bookings, shallow: true
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]

  get '/booking/:id/approve', to: 'bookings#approve', as: 'approve_booking'
  get '/booking/:id/decline', to: 'bookings#decline', as: 'decline_booking'
end
