Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
  post "/sessions" => "sessions#create"
  get "/players" => "players#index"
  get "/players/:account_id" => "players#show"
  post "/players" => "players#create"
  patch "/players/:id" => "players#update"
  delete "/followings/:id" => "followings#destroy"
end
