Rails.application.routes.draw do



  resources :trades
  resources :tradeviews
  get 'home/new_trade'
  get 'home/sidenav'
  get 'home/dashboard'
  get 'trade/new'
  get 'access/landing'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  root 'access#landing'
  post 'access/attempt_login'
  get 'access/logout'

  resources :users


  resources :tournaments do
    member do
      get :delete
    end
  end

  resources :players do
    member do
      get :delete
    end
  end

  resources :darters do
    member do
      get :delete
    end
  end

  resources :rounds do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
