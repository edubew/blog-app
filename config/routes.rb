Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
end
