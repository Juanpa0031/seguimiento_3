defmodule Temperatura do
  @moduledoc """
  Módulo para conversión de temperaturas entre escalas.
"""
 @doc """
  Realiza conversión de temperatura entre escalas termométricas.

  Solicita al usuario:
  - Nombre de la persona
  - Temperatura en grados Celsius (valor entero)

  Calcula las equivalentes en Fahrenheit y Kelvin, y muestra los resultados
  formateados con precisión decimal apropiada.

  """
  def temperatura do
    nombre = Util.input("Ingrese su nombre", :string)
    # Solicitar temperatura en grados Celsius (valor entero
    celsius = Util.input("temperatura en °C", :integer)

     # Conversión a Fahrenheit: F = (C × 9/5) + 32
    fahrenheit = (celsius * 9/5) + 32
    # Conversión a Kelvin: K = C + 273.15
    kelvin = celsius + 273.15

    # Mostrar resultados con formato adecuado para cada escala
    Util.show_message("""
    Nombre: #{nombre}
    Temperatur en °C #{:erlang.integer_to_binary(celsius)}
    #{nombre}, la temperatura es:
    #{:erlang.float_to_binary(fahrenheit, decimals: 1)}
    #{:erlang.float_to_binary(kelvin, decimals: 1)}
    """)

  end
end

Temperatura.temperatura()
