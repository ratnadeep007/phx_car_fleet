defmodule PhxPracticeWeb.BookController do
  use PhxPracticeWeb, :controller

  alias PhxPractice.Fleet
  # alias PhxPractice.Fleet.Car
  alias PhxPractice.Fleet.Booking

  def index(conn, _params) do
    fleet_cars = Fleet.list_free_cars()
    total = fleet_cars |> Enum.count()
    render(conn, :home, fleet_cars: fleet_cars, total_cars: total)
  end

  def new(conn, params) do
    car = Fleet.get_car!(params["car_id"])
    # car = %Car{model: "model", manufacturer: "test", reg_number: "123", id: 333}
    changeset = Fleet.change_booking(%Booking{car_id: car.id})
    render(conn, :new, car: car, changeset: changeset)
  end

  def create(conn, %{"booking" => booking_params}) do
    case Fleet.create_booking(booking_params) do
      {:ok, booking} ->
        booking.car_id
        |> Fleet.get_car!()
        |> case do
          nil -> {:error, "Car not found"}
          car -> Fleet.update_car(car, %{booked: true})
        end

        conn
        |> put_flash(:info, "Booking created successfully.")
        |> redirect(to: ~p"/book/#{booking}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    booking = Fleet.get_booking!(id)
    car = Fleet.get_car!(booking.car_id)
    render(conn, :show, booking: booking, car: car)
  end
end
