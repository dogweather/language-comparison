# Logic Server: My own [TodoMVC](https://todomvc.com) of server-side code

Comparing languages by re-implementing some typical functions.

- [x] Text Service functions
- [ ] GraphQL server


## Crystal

```Crystal
require "./spec_helper"


describe TextService do
  describe ".add_typography" do
    it "converts single quotes" do
      actual   = TextService.add_typography("dog's life")
      expected = "dog’s life"

      actual.should eq expected 
    end

    it "converts double quotes" do
      actual   = TextService.add_typography("\"Hey!\"")
      expected = "“Hey!”"

      actual.should eq expected
    end
  end

  describe ".add_html_typography" do
    it "creates simple fractions" do
      plaintext = "on 1/2 of an egg"
      expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

      TextService.add_html_typography(plaintext).should eq expected
    end
  end
end
```

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


## Python

```python
from text_service import add_html_typography, add_typography


class TestAddTypography:
    def test_converts_a_single_quote(_self):
        assert add_typography("dog's life") == "dog’s life"

    def test_converts_double_quotes(_self):
        assert add_typography("\"Hey!\"") == "“Hey!”"


class TestAddHtmlTypography:
    def test_creates_simple_fractions(_self):
      plaintext = "on 1/2 of an egg"
      expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

      assert add_html_typography(plaintext) == expected
```

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
