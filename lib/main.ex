defmodule Huescript.Main do
  alias Huescript.Light

  def main(args) do
    # Huescript.Light.list |> elem(1) |> Map.get(:body) |> Poison.decode! |> IO.inspect
    case args do
      ["office", "on"] -> Light.turn(:on, "10")
      ["office", "off"] -> Light.turn(:off, "10")
      _ -> IO.puts "Nothing happened"
    end
    IO.puts "Huescript ended."
  end
end
