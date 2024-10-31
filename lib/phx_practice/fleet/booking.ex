defmodule PhxPractice.Fleet.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "booking" do
    field :car_id, :id
    field :driver_id, :id
    field :for, :utc_datetime
    field :name, :string
    field :phone, :string
    field :closed, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:car_id, :driver_id, :for, :name, :phone, :closed])
    |> validate_required([:car_id, :for, :name, :phone, :closed])
  end
end
