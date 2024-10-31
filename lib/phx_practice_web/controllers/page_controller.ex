defmodule PhxPracticeWeb.PageController do
  use PhxPracticeWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    IO.inspect(conn.request_path)
    # render(conn, :home, layout: false)
    render(conn, :home)
  end
end
