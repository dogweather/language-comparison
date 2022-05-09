import TextService, only: [add_typography: 1, add_html_typography: 1]


defmodule TextServiceTest do
  use ExUnit.Case
  doctest TextService

  #
  # .add_typography
  #

  test "converts single quotes" do
    assert add_typography("dog's life") == "dog’s life"
  end

  test "converts double quotes" do
    assert add_typography("\"Hey!\"") == "“Hey!”"
  end


  #
  # .add_html_typography
  #

  test "creates simple fractions" do
    plaintext = "on 1/2 of an egg"
    expected  = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

    assert add_html_typography(plaintext) == expected
  end
end
