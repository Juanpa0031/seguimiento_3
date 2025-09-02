defmodule Peaje do
  @moduledoc """
  Módulo para el registro y cálculo de tarifas de peaje.

  Sistema de gestión de peajes que calcula tarifas según:
  - Tipo de vehículo (Carro, Moto, Camión)
  - Peso del vehículo (solo aplicable para camiones)

  Proporciona funcionalidades para registrar vehículos y calcular tarifas automáticamente.
  """
  @doc """
  Registrar un vehículo en el sistema de peaje y calcula su tarifa.
  Solicita al usuario:
  - Placa del vehículo
  - Tipo de vehículo
  - Peso en toneladas (especialmente relevante para camiones)

  Calcula la tarifa correspondiente y muestra un resumen del pago requerido.

  ## Returns
    Tupla con la forma `{placa, tipo, tarifa_final}` conteniendo los datos del registro.
    """

  def registrar do
    placa = Util.input("Ingrese la placa del vehículo", :string)
    tipo = Util.input("Ingrese el tipo de vehículo (Carro, Moto, Camión)", :string)
    peso = Util.input("Ingrese el peso del vehículo (toneladas)", :float)

    tarifa_final = calcular_tarifa(tipo, peso)

    # Mostrar mensaje con los detalles del pago requerido
    Util.show_message("""
    Vehículo #{placa} (#{tipo}) debe pagar $#{:erlang.integer_to_binary(tarifa_final)}.
    """)

    # Retornar tupla con información del registro para posible procesamiento posterior
    {placa, tipo, tarifa_final}
  end
#funcion privada: Tarifas para calcular la tarifa de los vehiculos correspondientes

  defp calcular_tarifa("Carro", _peso), do: 10_000
  defp calcular_tarifa("Moto", _peso), do: 5_000
  defp calcular_tarifa("Camión", peso) do
    20_000 + trunc(peso) * 2_000
  end

  # Si alguien escribe algo diferente
  defp calcular_tarifa(_, _), do: 0
end

# Ejecutamos la función principal al cargar el archivo

Peaje.registrar()
