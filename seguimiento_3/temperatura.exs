defmodule Temperatura do
  def temperatura do
    nombre = Util.input("Ingrese su nombre", :string)
    celsius = Util.input("temperatura en °C", :integer)

    fahrenheit = (celsius * 9/5) + 32
    kelvin = celsius + 273.15

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
