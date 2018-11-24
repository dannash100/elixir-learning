defmodule HigherOrderFunctionsTest do
  use ExUnit.Case
  doctest HigherOrderFunctions

  test "greets the world" do
    assert HigherOrderFunctions.hello() == :world
  end
end
