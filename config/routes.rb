Rails.application.routes.draw do
  devise_for :users
  resources :wikis
  resources :charges
  get 'welcome/standard'
  get  'welcome/premium'
  get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
