Rails.application.routes.draw do

  namespace :users do
    get 'post_comments/create'
    get 'post_comments/destroy'
  end
# admin
  devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :expense_types, only: [:index, :create, :edit, :update, :destroy]
    resources :income_types, only: [:index, :create, :edit, :update, :destroy]
  end

# User
  devise_for :users, controllers: {
    sessions:       'users/sessions',
    passwords:      'users/passwords',
    registrations:  'users/registrations'
}

  root to: "users/homes#top"
  get "/about" => "users/homes#about"

  scope module: :users do
    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    resources :expenses, only: [:new, :create, :show, :edit, :update, :destroy] do
      collection do
        get :daily
        get :monthly
      end
    end

    resources :users, only: [:show, :edit, :update] do
  		member do
  	     get "quit"
  	     patch "out"
  	  end
  	end


  end

  end
