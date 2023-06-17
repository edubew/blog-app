# config/routes.rb
Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments
    end
  end
end
