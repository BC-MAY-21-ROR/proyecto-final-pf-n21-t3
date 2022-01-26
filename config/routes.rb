Rails.application.routes.draw do
  #devise_for :users
  root to: "users#index"
 
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
end
