Rails.application.routes.draw do


  devise_for :users
  resources :wikis do
    resources :collaborators
  end
  resources :charges
  get 'welcome/standard'
  get  'welcome/premium'
  get 'users/sign_out' => 'welcome#index'
  root 'welcome#index'
  put '/downgrade' => "charges#downgrade"
  get 'users/all' => "users#index"
  put 'admin/:id' => 'users#make_admin', :as => "make_admin"
  put 'premium/:id' => 'users#make_premium', :as => "make_premium"
  put 'standard/:id' => 'users#make_standard', :as => "make_standard"

end
