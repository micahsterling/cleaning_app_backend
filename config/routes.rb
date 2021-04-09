Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE

  namespace :api do
    get "/posts" => "posts#index"
    get "/posts/:id" => "posts#show"
    post "/posts/" => "posts#create"
    patch "/posts/:id" => "posts#update"
  end
end
