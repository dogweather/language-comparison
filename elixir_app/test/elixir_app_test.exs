defmodule ElixirAppTest do
  use ExUnit.Case
  doctest ElixirApp

  test "Doesn't change string w/out quotes" do
    assert ElixirApp.double_quotes("Just some words") == "Just some words"
  end

  test "works for a single quote" do
    assert ElixirApp.double_quotes("Robb's dog") == "Robb’s dog"
  end

  test "works for double quotes" do
    assert ElixirApp.double_quotes("\"Hello\"") == "“Hello”"
  end
end
