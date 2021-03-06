Rails.application.routes.draw do
  root to: 'profiles#index'
  devise_for :users

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'users/log_in'   => 'devise/sessions#new'
    get 'users/log_out'  => 'devise/sessions#destroy'
    get 'users/sign_up'  => 'devise/registrations#new'
    get 'users/edit_profile' => 'devise/registrations#edit'
  end

  resources :profiles, only: [:edit, :update, :show, :new, :create, :index]
  resources :skills, only: [ :new, :create, :destroy]
  resources :social_networks, only: [:new, :create, :destroy]
end
