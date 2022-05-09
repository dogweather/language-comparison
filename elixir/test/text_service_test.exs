defmodule TextServiceTest do
  use ExUnit.Case
  doctest TextService

  test "greets the world" do
    assert TextService.hello() == :world
  end
end
