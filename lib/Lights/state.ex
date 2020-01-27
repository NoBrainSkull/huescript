defmodule Huescript.Light.State do
  defstruct [
    :on,
    :bri,
    :hue,
    :sat,
    :xy_cie_color,
    :color_temperature,
    :alert,
    :effect,
    :transitiontime,
    :brightness_inc,
    :saturation_inc,
    :hue_inc,
    :color_temp_inc,
    :xy_cie_color_inc
  ]

  def to_json(%__module__{} = state), do: Poison.encode!(state)
end
