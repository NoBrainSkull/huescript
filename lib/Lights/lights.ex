defmodule Huescript.Light do
  alias Huescript.Light.State
  alias Huescript.Http.Request

  def list, do: Request.get("/lights")
  def info(id), do: Request.get("/lights/#{id}")
  def turn(:off, id), do: set_state(id, %State{ on: false })
  def turn(:on, id), do: set_state(id, %State{ on: true })
  def colorloop(id), do: set_state(id, %State{ effect: "colorloop" })
  def alert(id), do: set_state(id, %State{ alert: "lselect" })
  def alert(id, :once), do: set_state(id, %State{ alert: "select" })

  defp set_state(id, %State{} = state) do
    case Request.put("/lights/#{id}/state", State.to_json(state)) do
      {:ok, result} -> result
      {_, error} -> IO.inspect error
    end
  end
end
