defmodule PhxPracticeWeb.PhxPracticeWeb.DriverHTML do
  use PhxPracticeWeb, :html

  embed_templates "driver_html/*"

  @doc """
  Renders a driver form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def driver_form(assigns)
end
