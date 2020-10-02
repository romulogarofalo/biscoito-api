defmodule BiscoitoWeb.Router do
  use BiscoitoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug BiscoitoWeb.Plug.AuthAccessPipeline
  end

  scope "/api", BiscoitoWeb do
    pipe_through [:api, :authenticated]

    resources "/users", UserController, except: [:create, :edit]
  end

  scope "/api", BiscoitoWeb do
    pipe_through [:api]

    post "/lists", ListsController, :create
    post "/signup", UserController, :create

    scope "/auth" do
      post "/identity/callback", AuthenticationController, :login
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BiscoitoWeb.Telemetry
    end
  end
end
