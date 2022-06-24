require Floki
import String

defmodule TextService do
  @moduledoc """
  Plaintext and HTML manipulation.
  """

  @doc """
  Return a new string enhanced with typographic characters:
    Single quotes: ’
    Double quotes: “”
  """
  def add_typography(text) do
    text
    |> replace(~r/\"([^\"]+)\"/, "“\\1”")
    |> replace(~r/'/, "’")
  end

  @doc """
  Add nicer typography that HTML can provide:
    Fractions using superscript and subscript.
  """
  @spec add_html_typography(text :: binary) :: binary
  def add_html_typography(text) do
    text
    |> replace(~r/\b(\d+)\/(\d+)\b/, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end
end
