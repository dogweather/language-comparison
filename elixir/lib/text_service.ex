import String

defmodule TextService do
  @moduledoc """
  Documentation for `TextService`.
  """

  @spec add_typography(binary) :: binary
  def add_typography(text) do
    text
    |> replace(~r/\"([^\"]+)\"/, "“\\1”")
    |> replace(~r/'/, "’")
  end
end
