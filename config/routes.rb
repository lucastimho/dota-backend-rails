Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  post "/sessions" => "sessions#create"
  get "/players" => "players#index"
  get "/players/:account_id" => "players#show"
  post "/players/:account_id" => "players#create"
  patch "/players/:id" => "players#update"
  get "followings" => "followings#index"
  post "/followings/:account_id" => "followings#create"
  patch "/followings/:id" => "followings#update"
  delete "/followings/:player_id" => "followings#destroy"
  get "/recent" => "users#recent"
  get "/user" => "users#show"  
end
