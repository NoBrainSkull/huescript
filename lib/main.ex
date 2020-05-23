defmodule Huescript.Main do
  alias Huescript.Light

  def main(args) do
    # Huescript.Light.list |> elem(1) |> Map.get(:body) |> Poison.decode! |> IO.inspect
    case args do
      ["office", "on"] -> Light.turn(:on, "10")
      ["office", "off"] -> Light.turn(:off, "10")
      ["bedroom", "on"] -> Light.turn(:on, "8")
      ["bedroom", "off"] -> Light.turn(:off, "8")
      ["living", "on"] -> Light.turn(:on, "15")
      ["living", "off"] -> Light.turn(:off, "15")
      ["office", "colorloop"] -> Light.colorloop("10")
      ["office", "alert"] -> Light.alert("10")
      ["lights", "list"] -> Light.list |> IO.inspect
      ["lights", "info", id] -> Light.info(id) |> IO.inspect
      ["lights", "turn", id, "on"] -> Light.turn(:on, id)
      ["lights", "turn", id, "off"] -> Light.turn(:off, id)
      _ -> IO.puts "Nothing happened"
    end
    IO.puts "Huescript ended."
  end
end
