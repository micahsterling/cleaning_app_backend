Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE

  namespace :api do
    get "/posts" => "posts#index"
    get "/posts/:id" => "posts#show"
    post "/posts/" => "posts#create"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/categories" => "categories#index"
    
    get "/tags" => "tags#index"

    get "/products" => "products#index"
  end
end
