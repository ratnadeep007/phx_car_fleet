defmodule PhxPractice.FleetFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxPractice.Fleet` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(%{
        manufacturer: "some manufacturer",
        model: "some model",
        reg_number: "some reg_number"
      })
      |> PhxPractice.Fleet.create_car()

    car
  end

  @doc """
  Generate a driver.
  """
  def driver_fixture(attrs \\ %{}) do
    {:ok, driver} =
      attrs
      |> Enum.into(%{
        name: "some name",
        phone: "some phone"
      })
      |> PhxPractice.Fleet.create_driver()

    driver
  end
end
