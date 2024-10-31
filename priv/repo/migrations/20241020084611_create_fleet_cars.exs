defmodule PhxPractice.Repo.Migrations.CreateFleetCars do
  use Ecto.Migration

  def change do
    create table(:fleet_cars) do
      add :manufacturer, :string
      add :model, :string
      add :reg_number, :string

      timestamps(type: :utc_datetime)
    end
  end
end
