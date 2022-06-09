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
  @spec add_typography(binary) :: binary
  def add_typography(text) do
    text
    |> replace(~r/\"([^\"]+)\"/, "“\\1”")
    |> replace(~r/'/, "’")
  end

  @doc """
  Add nicer typography that HTML can provide:
    Fractions using superscript and subscript.
  """
  @spec add_html_typography(binary) :: binary
  def add_html_typography(text) do
    text
    |> replace(~r/\b(\d+)\/(\d+)\b/, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end

  @spec add_pinpoint_ids(binary) :: binary
  def add_pinpoint_ids(body_text) do
    {:ok, sections} = Floki.parse_document(body_text)

    Floki.raw_html(add_ids_to_sections(sections))
  end

  defp add_ids_to_sections(id_stack \\ [], [only_section]) do
    {"section", [{"class", css_classes}], children} = only_section

    if contains?(css_classes, "level-") do
      [_, level] = Regex.run(~r/^level-(\d)/, css_classes)
      level = to_integer(level)

      if level == 0 do
      end

      {"section", [{"class", css_classes}], children}
    else
      {"section", [{"class", css_classes}], children}
    end
  end
end
