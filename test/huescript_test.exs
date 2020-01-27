defmodule HuescriptTest do
  use ExUnit.Case
  doctest Huescript

  test "greets the world" do
    assert Huescript.hello() == :world
  end
end
