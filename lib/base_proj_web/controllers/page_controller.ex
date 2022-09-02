defmodule BaseProjWeb.PageController do
  use BaseProjWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
