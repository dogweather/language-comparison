# Logic Server: My own [TodoMVC](https://todomvc.com) of server-side code

Comparing languages by re-implementing some typical functions.

- [x] Text Service functions
- [ ] GraphQL server


**Code Samples**

Here are samples of each language. Or browse the folders to see tests and config files.

* [Crystal](#Crystal)
* [Elixir](#Elixir)
* [Python](#Python)


## Crystal

```Crystal
# Plaintext and HTML manipulation.
module TextService
  extend self

  #
  # Return a new string enhanced with typographic characters:
  #  Single quotes: ’
  #  Double quotes: “”
  #
  def add_typography(text : String) : String
    text.gsub(/"([^"]+)"/, "“\\1”")
        .gsub('\'', '’')
  end


  #
  # Add nicer typography that HTML can provide:
  #  Fractions using superscript and subscript.
  #
  def add_html_typography(text : String) : String
    text.gsub(%r{\b(\d+)/(\d+)\b}, "<sup>\\1</sup>&frasl;<sub>\\2</sub>")
  end
end
```

## Elixir

```elixir
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
end
```

## Python

```python
import re

DOUBLE_QUOTED_TEXT = re.compile(r'"([^"]+)"')       # "Hello"
FRACTION           = re.compile(r'\b(\d+)/(\d+)\b') # 1/2


def add_typography(text: str) -> str:
    """ Return a new string enhanced with typographic characters:
          Single quotes: ’
          Double quotes: “”
    """
    return DOUBLE_QUOTED_TEXT.sub(r'“\1”', text).replace("'", "’")


def add_html_typography(text: str) -> str:
    """ Add nicer typography that HTML can provide:
          Fractions using superscript and subscript.
    """
    return FRACTION.sub(r'<sup>\1</sup>&frasl;<sub>\2</sub>', text)
```
