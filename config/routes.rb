Rails.application.routes.draw do

  root 'dashboard#home'

  resources :players do
    member do
      get "fetch_data"
    end
  end
end
