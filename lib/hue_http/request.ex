defmodule Huescript.Http.Request do
  @protocol "http"
  @bridge_ip "192.168.1.8"
  @user_name "KNYgj67MOswY7nR6BEf31QDTgO5lNgFwfSsxv5tQ"

  def get(route), do: get(route, [])
  def get(route, params) do
    params
      |> Enum.reduce(base_url(route), fn param, url -> add_query_param(url, param) end)
      |> HTTPoison.get
  end

  def post(route, body \\ nil), do: HTTPoison.post(base_url(route), body)
  def put(route, body \\ nil), do: HTTPoison.put(base_url(route), body)


  defp base_url(route), do: "#{@protocol}://#{@bridge_ip}/api/#{@user_name}#{route}"

  defp add_query_param(url, %{name: name, value: value}) do
    cond do
      String.contains?(url, "?") -> "#{url}&#{name}=#{value}"
      true -> "#{url}?#{name}=#{value}"
    end
  end
  defp add_query_param(_url, _), do: throw "Bad parameter"
end
