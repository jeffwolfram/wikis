Rails.application.routes.draw do
  devise_for :users


  get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
end
