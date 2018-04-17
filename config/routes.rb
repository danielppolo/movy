Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :bikes do
    # Modify according to Francesco's routes
    resources :bookings, shallow: true
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]
  #adicional
  # get "profile/create"
  # get "profile/new"
  # get "profile/destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
