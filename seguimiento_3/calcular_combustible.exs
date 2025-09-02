defmodule Combustible do
  @moduledoc """
  El módulo `Combustible` permite calcular el rendimiento de un vehículo
  a partir de la distancia recorrida y el combustible consumido.
  """

  @doc """
  Calcula el consumo de combustible y muestra los resultados.

  Esta función interactúa con el usuario para obtener:
  - Nombre del conductor
  - Distancia recorrida en kilómetros
  - Combustible consumido en litros

  Luego calcula el rendimiento (km/L) y muestra un reporte formateado.
  """

  # Solicita datos al usuario y muestra resultados

  def calcular_consumo do

    nombre = Util.input("Nombre del conductor", :string)
    distancia = Util.input("Distancia recorrida (km)", :float)
    litros = Util.input("Combustible consumido (litros)", :float)

    rendimiento = distancia / litros

# Mostrar resultados con 2 decimales
Util.show_message("""
--- Resultados ---
Conductor: #{nombre}
Distancia: #{:erlang.float_to_binary(distancia, decimals: 2)} km
Combustible: #{:erlang.float_to_binary(litros, decimals: 2)} L
Rendimiento: #{:erlang.float_to_binary(rendimiento, decimals: 2)} km/L
""")
  end
end
# Ejecutar la función principal
Combustible.calcular_consumo()
