Rails.application.routes.draw do
  devise_for :users
  resources :wikis

  get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
