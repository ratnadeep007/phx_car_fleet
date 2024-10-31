defmodule PhxPracticeWeb.BookHTML do
  @moduledoc """
  This module contains pages rendered by BookController.

  See the `book_html` directory for all templates available.
  """
  use PhxPracticeWeb, :html

  embed_templates "book_html/*"
end
