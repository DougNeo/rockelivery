defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router

  alias RockeliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RockeliveryWeb do
    pipe_through :api

    get "/", WelcomeController, :index
    resources "/users", UsersController, except: [:new, :edit]
    post "/items", ItemsController, :create
  end
end
