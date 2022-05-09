defmodule TextServiceTest do
  use ExUnit.Case
  doctest TextService

  test "converts single quotes" do
    assert TextService.add_typography("dog's life") == "dog’s life"
  end

  test "converts double quotes" do
    assert TextService.add_typography("\"Hey!\"") == "“Hey!”"
  end
end
