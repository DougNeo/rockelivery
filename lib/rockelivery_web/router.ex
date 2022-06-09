defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router

  alias RockeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  pipeline :auth do
    plug RockeliveryWeb.Auth.Pipeline
  end

  scope "/api", RockeliveryWeb do
    pipe_through [:api, :auth]

    resources "/users", UsersController, except: [:new, :edit, :create]
    post "/items", ItemsController, :create
    post "/orders", OrdersController, :create
  end

  scope "/api", RockeliveryWeb do
    pipe_through :api

    get "/", WelcomeController, :index
    post "/users", UsersController, :create
    post "/users/signin", UsersController, :sign_in
  end
end
