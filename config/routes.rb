PlazrAuth::Engine.routes.draw do
  
  devise_for  :users, 
          :controllers => { 
            :omniauth_callbacks => 'plazr_auth/users/omniauth_callbacks',
          }, 
          :class_name => 'PlazrAuth::User',
          :module => :devise

  match '/profile' => 'users#profile', :as => 'profile'

  match '/admin' => 'admin/admin#index', :as => 'admin'
  
  match '/confirm/:confirmation_token',
      :to => 'devise/confirmations#show',
      :as => 'user_confirm', :only_path => false

  resources :users
  namespace :admin do
    resources :users
  end
  
  resources :paypal_accounts

end
