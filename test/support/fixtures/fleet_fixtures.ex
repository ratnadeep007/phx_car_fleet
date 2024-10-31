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
end
