Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
      resources :sections
      resources :users
      resources :contributions
      resources :comments
      resources :likes
    end
  end
end
