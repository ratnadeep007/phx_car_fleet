defmodule PhxPractice.Fleet.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fleet_cars" do
    field :manufacturer, :string
    field :model, :string
    field :reg_number, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:manufacturer, :model, :reg_number])
    |> validate_required([:manufacturer, :model, :reg_number])
  end
end
