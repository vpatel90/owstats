Rails.application.routes.draw do

  root 'dashboard#home'

  resources :players do
    collection do
      get "fetch_data"
    end
  end
end
