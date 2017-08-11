Rails.application.routes.draw do
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
