defmodule Envio do

  @moduledoc """
  Módulo para calcular costos de envío de paquetes.

  Proporciona funcionalidades para calcular el costo de envío basado en:
  - Tipo de envío (Económico, Express, Internacional)
  - Peso del paquete en kilogramos

  Incluye diferentes estrategias de cálculo según el tipo de envío seleccionado.
  """

@doc """
Calcula el costo de envío de un paquete según las reglas de negocio para cada tipo de envío
  y devuelve una tupla con todos los datos del envío.

  Solicita al usuario:
  - Nombre del cliente
  - Peso del paquete en kg
  - Tipo de envío deseado
"""

  def calcular do
    cliente = Util.input("Ingrese el nombre del cliente", :string)
    peso = Util.input("Ingrese el peso del paquete en kg", :float)

    tipo_input = Util.input("Ingrese el tipo de envío (Económico, Express, Internacional)", :string)

    # condiciones para tipo de envío para evitar errores con mayúsculas/minúsculas
    tipo_envio =
      tipo_input
      |> String.downcase()
      |> case do
        "económico" -> "Económico"
        "economico" -> "Económico"
        "express" -> "Express"
        "internacional" -> "Internacional"
        _ -> "Desconocido" # Valor por defecto para entradas inválidas
      end

    # Cálculo del costo usando distintas estructuras de control de Elixir
    # según el tipo de envío seleccionado
    costo_total =
      case tipo_envio do
        "Económico" ->

         # Usando estructura if para validar peso positivo
          if peso > 0 do
            trunc(peso * 5_000)
          else
            0
          end

        "Express" ->
          peso * 8_000 |> trunc()

        "Internacional" ->
          # Usando cond para múltiples condiciones
          cond do
            peso <= 5 -> trunc(peso * 15_000)
            peso > 5 -> trunc(peso * 12_000)
          end

        _ ->
          0 # Costo cero para tipos de envío desconocidos
      end
# Mostrar resumen del envío al usuario
    Util.show_message("""
    Cliente: #{cliente}
    Tipo de envío: #{tipo_envio}
    Peso: #{peso} kg
    Costo total: $#{:erlang.integer_to_binary(costo_total)}
    """)

    # Retornar tupla con todos los datos para posible uso posterior
    {cliente, peso, tipo_envio, costo_total}
  end
end

Envio.calcular()
