Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
      resources :sections
      resources :users
      post 'user/token' => 'user_token#create'
      get 'users/current' => 'users#current'
      resources :contributions
      resources :comments
      resources :likes
    end
  end
end
