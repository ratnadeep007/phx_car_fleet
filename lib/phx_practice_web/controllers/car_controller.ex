defmodule PhxPracticeWeb.PhxPracticeWeb.CarController do
  use PhxPracticeWeb, :controller

  alias PhxPractice.Fleet
  alias PhxPractice.Fleet.Car

  def index(conn, _params) do
    fleet_cars = Fleet.list_fleet_cars()
    total = fleet_cars |> Enum.count()
    render(conn, :index, fleet_cars: fleet_cars, total_cars: total)
  end

  def new(conn, _params) do
    changeset = Fleet.change_car(%Car{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"car" => car_params}) do
    case Fleet.create_car(car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car created successfully.")
        |> redirect(to: ~p"/fleet_cars/#{car}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    car = Fleet.get_car!(id)
    render(conn, :show, car: car)
  end

  def edit(conn, %{"id" => id}) do
    car = Fleet.get_car!(id)
    changeset = Fleet.change_car(car)
    render(conn, :edit, car: car, changeset: changeset)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = Fleet.get_car!(id)

    case Fleet.update_car(car, car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car updated successfully.")
        |> redirect(to: ~p"/fleet_cars/#{car}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, car: car, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Fleet.get_car!(id)
    {:ok, _car} = Fleet.delete_car(car)

    conn
    |> put_flash(:info, "Car deleted successfully.")
    |> redirect(to: ~p"/fleet_cars")
  end
end
