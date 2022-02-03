Rails.application.routes.draw do
  root to: 'feeds#index'
  devise_for :users

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'users/log_in'   => 'devise/sessions#new'
    get 'users/log_out'  => 'devise/sessions#destroy'
    get 'users/sign_up'  => 'devise/registrations#new'
    get 'users/edit_profile' => 'devise/registrations#edit'
  end
end
