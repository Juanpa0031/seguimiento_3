defmodule Envio do
  def calcular do
    cliente = Util.input("Ingrese el nombre del cliente", :string)
    peso = Util.input("Ingrese el peso del paquete en kg", :float)

    tipo_input = Util.input("Ingrese el tipo de envío (Económico, Express, Internacional)", :string)

    # Normalizamos el tipo de envío para evitar errores con mayúsculas/minúsculas
    tipo_envio =
      tipo_input
      |> String.downcase()
      |> case do
        "económico" -> "Económico"
        "economico" -> "Económico"
        "express" -> "Express"
        "internacional" -> "Internacional"
        _ -> "Desconocido"
      end

    # Cálculo del costo usando distintas estructuras de control
    costo_total =
      case tipo_envio do
        "Económico" ->
          # if
          if peso > 0 do
            trunc(peso * 5_000)
          else
            0
          end

        "Express" ->
          peso * 8_000 |> trunc()

        "Internacional" ->
          # cond
          cond do
            peso <= 5 -> trunc(peso * 15_000)
            peso > 5 -> trunc(peso * 12_000)
          end

        _ ->
          0
      end

    Util.show_message("""
    Cliente: #{cliente}
    Tipo de envío: #{tipo_envio}
    Peso: #{peso} kg
    Costo total: $#{:erlang.integer_to_binary(costo_total)}
    """)

    {cliente, peso, tipo_envio, costo_total}
  end
end

Envio.calcular()
