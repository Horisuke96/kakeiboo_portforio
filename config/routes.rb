Rails.application.routes.draw do

  namespace :users do
    get 'homes/top'
    get 'homes/about'
  end
# admin
  devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
  end

# User
  devise_for :users, controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
    registrations:  'users/registrations'
}

  root to: "user/homes#top"
  get "/about" => "user/homes#about"



  end
