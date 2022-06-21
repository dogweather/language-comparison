import String

defmodule PinpointXref do
  @moduledoc """
  Code for adding pinpoint citation cross-reference links.
  """

  def add_pinpoint(text) do
    text
    |> replace(
      ~r/">article (\d+)<\/a>, paragraph (\d+)/,
      ~s[#\\g{2}">article \\g{1}, paragraph \\g{2}</a>]
    )
  end
end
