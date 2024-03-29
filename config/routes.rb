Rails.application.routes.draw do
 

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
     get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    
    delete "logout", :to => "users/sessions#destroy"
  end
  resources :products do
     member do
      get :favorite
    end
    resources :reviews, only: [:create]
  end
  
  resource :users, only: [:edit, :update] do
    collection do
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      get "mypage/address/edit", :to => "users#edit_address"
      put "mypage", :to => "users#update"
      get "mypage/edit_password", :to =>"users#edit_password"
      put "mypage/password", :to => "users#update_password"
      get  "mypage/favorite", :to => "users#favorite"
    end
  end
end
