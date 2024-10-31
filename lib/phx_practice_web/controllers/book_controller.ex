defmodule PhxPracticeWeb.BookController do
  use PhxPracticeWeb, :controller

  def index(conn, _params) do
    # IO.inspect(conn.request_path)
    # assign(conn, :name, "test")
    # conn.assign(:name, "test")
    render(conn, :home, name: "test")
  end
end
