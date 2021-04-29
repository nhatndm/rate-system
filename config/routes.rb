Rails.application.routes.draw do

  # rates
  get '/rates', to: "rates#index"
  post '/rates/add_point', to: "rates#add_rate"
  put '/rates/:id', to: "rates#update"
  get '/rates/report', to: "rates#report"

  # answer
  get '/answers', to: "answers#index"
  post '/answers', to: "answers#create"
  get '/answers/:id', to: "answers#show"

  # question
  get '/questions', to: "questions#index"
  post '/questions', to: "questions#create"
  get '/questions/:id', to: "questions#show"
  put '/questions/:id', to: "questions#update"
  delete '/questions/:id', to: "questions#delete"

  # User Route
  get '/users', to: "users#index"
  post '/users', to: "users#create"
  get '/users/:id', to: "users#show"
  put '/users/:id', to: "users#update"
  delete '/users/:id', to: "users#delete"
end
