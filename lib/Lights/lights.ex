defmodule Huescript.Light do
  alias Huescript.Light.State
  alias Huescript.Http.Request

  def list, do: Request.get("/lights")
  def turn(:off, id), do: set_state(id, %State{ on: false })
  def turn(:on, id), do: set_state(id, %State{ on: true })

  defp set_state(id, %State{} = state) do
    Request.put("/lights/#{id}/state", State.to_json(state))
  end
end
