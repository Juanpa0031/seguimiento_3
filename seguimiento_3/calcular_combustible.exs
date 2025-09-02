defmodule Combustible do
  def calcular_consumo do
    nombre = Util.input("Nombre del conductor", :string)
    distancia = Util.input("Distancia recorrida (km)", :float)
    litros = Util.input("Combustible consumido (litros)", :float)

    rendimiento = distancia / litros

Util.show_message("""
--- Resultados ---
Conductor: #{nombre}
Distancia: #{:erlang.float_to_binary(distancia, decimals: 2)} km
Combustible: #{:erlang.float_to_binary(litros, decimals: 2)} L
Rendimiento: #{:erlang.float_to_binary(rendimiento, decimals: 2)} km/L
""")
  end
end

Combustible.calcular_consumo()
