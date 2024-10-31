defmodule PhxPracticeWeb.PhxPracticeWeb.DriverController do
  use PhxPracticeWeb, :controller

  alias PhxPractice.Fleet
  alias PhxPractice.Fleet.Driver

  def index(conn, _params) do
    drivers = Fleet.list_drivers()
    render(conn, :index, drivers: drivers)
  end

  def new(conn, _params) do
    changeset = Fleet.change_driver(%Driver{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"driver" => driver_params}) do
    case Fleet.create_driver(driver_params) do
      {:ok, driver} ->
        conn
        |> put_flash(:info, "Driver created successfully.")
        |> redirect(to: ~p"/drivers/#{driver}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Fleet.get_driver!(id)
    render(conn, :show, driver: driver)
  end

  def edit(conn, %{"id" => id}) do
    driver = Fleet.get_driver!(id)
    changeset = Fleet.change_driver(driver)
    render(conn, :edit, driver: driver, changeset: changeset)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Fleet.get_driver!(id)

    case Fleet.update_driver(driver, driver_params) do
      {:ok, driver} ->
        conn
        |> put_flash(:info, "Driver updated successfully.")
        |> redirect(to: ~p"/drivers/#{driver}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, driver: driver, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Fleet.get_driver!(id)
    {:ok, _driver} = Fleet.delete_driver(driver)

    conn
    |> put_flash(:info, "Driver deleted successfully.")
    |> redirect(to: ~p"/drivers")
  end
end
