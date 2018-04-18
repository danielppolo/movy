Rails.application.routes.draw do
  root to: 'bikes#index'

  devise_for :users

  resources :bikes do
    resources :bookings, shallow: true
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]

  get '/bookings/:id/approve', to: 'bookings#approve', as: 'approve_booking'
  get '/bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'
  get '/bikes/:id/availability', to: 'bikes#toggle', as: 'toggle_bike'
end
