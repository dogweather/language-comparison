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
