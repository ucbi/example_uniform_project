defmodule BaseProjWeb.Router do
  use BaseProjWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BaseProjWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # uniform:remove
  scope "/", BaseProjWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
  # /uniform:remove

  # uniform:app:tweeter
  scope "/tweeter", TweeterWeb do
    pipe_through :browser

    live "/", TweetsLive, :tweets
  end
  # /uniform:app:tweeter

  # uniform:app:twadmin
  scope "/twadmin", TwadminWeb do
    pipe_through :browser

    live "/", AdminLive, :admin
  end
  # /uniform:app:twadmin

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: BaseProjWeb.Telemetry
    end
  end
end
