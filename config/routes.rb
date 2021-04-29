Rails.application.routes.draw do

  # User Route
  get '/users', to: "users#index"
  post '/users', to: "users#create"
  get '/users/:id', to: "users#show"
  put '/users/:id', to: "users#update"
  delete '/users/:id', to: "users#delete"
end
