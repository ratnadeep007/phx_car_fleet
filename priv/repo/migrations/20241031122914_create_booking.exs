defmodule PhxPractice.Repo.Migrations.CreateBooking do
  use Ecto.Migration

  def change do
    create table(:booking) do
      add :car_id, references(:fleet_cars, on_delete: :nothing)
      add :driver_id, references(:drivers, on_delete: :nothing)
      add :for, :utc_datetime
      add :name, :string
      add :phone, :string
      add :closed, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
