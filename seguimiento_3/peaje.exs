defmodule Peaje do
  def registrar do
    placa = Util.input("Ingrese la placa del vehículo", :string)
    tipo = Util.input("Ingrese el tipo de vehículo (Carro, Moto, Camión)", :string)
    peso = Util.input("Ingrese el peso del vehículo (toneladas)", :float)

    tarifa_final = calcular_tarifa(tipo, peso)

    Util.show_message("""
    Vehículo #{placa} (#{tipo}) debe pagar $#{:erlang.integer_to_binary(tarifa_final)}.
    """)

    {placa, tipo, tarifa_final}
  end

  defp calcular_tarifa("Carro", _peso), do: 10_000
  defp calcular_tarifa("Moto", _peso), do: 5_000
  defp calcular_tarifa("Camión", peso) do
    20_000 + trunc(peso) * 2_000
  end

  # Si alguien escribe algo diferente
  defp calcular_tarifa(_, _), do: 0
end

Peaje.registrar()
