defmodule PhxPracticeWeb.BookController do
  use PhxPracticeWeb, :controller

  alias PhxPractice.Fleet

  def index(conn, _params) do
    fleet_cars = Fleet.list_fleet_cars()
    total = fleet_cars |> Enum.count()
    render(conn, :home, fleet_cars: fleet_cars, total_cars: total)
  end
end
