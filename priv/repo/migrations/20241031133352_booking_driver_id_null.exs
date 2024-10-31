defmodule PhxPractice.Repo.Migrations.BookingDriverIdNull do
  use Ecto.Migration

  def change do
    execute "ALTER TABLE booking DROP CONSTRAINT booking_driver_id_fkey"
    alter table(:booking) do
      modify :driver_id, references(:drivers, on_delete: :nothing), null: true
    end
  end
end
