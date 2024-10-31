defmodule PhxPractice.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string
      add :phone, :string
      add :car_id, references(:fleet_cars, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:drivers, [:car_id])
  end
end
