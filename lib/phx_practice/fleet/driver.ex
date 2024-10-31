defmodule PhxPractice.Fleet.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :name, :string
    field :phone, :string
    field :car_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :phone])
    |> validate_required([:name, :phone])
  end
end
