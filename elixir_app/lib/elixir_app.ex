import String

defmodule ElixirApp do
  # Convert " " to “ ” and ' to ’.
  def double_quotes(text) do
    text
    |> replace(~r/\"([^\"]+)\"/, "“\\1”")
    |> replace(~r/'/, "’")
  end
end
