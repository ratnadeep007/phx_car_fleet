defmodule PhxPractice.Repo.Migrations.FleetCarsAddBookedColumn do
  use Ecto.Migration

  def change do
    alter table(:fleet_cars) do
      add :booked, :boolean, default: false, null: false
    end
  end
end
