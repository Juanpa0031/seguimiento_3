defmodule Salario do
@moduledoc """
  El módulo `Salario` permite calcular el salario total de un empleado,
  incluyendo el pago de horas extras trabajadas.
  """
  @doc """
  Calcula el salario total de un empleado a partir de su salario base y
  las horas extras trabajadas.

  ## Parámetros solicitados al usuario
    - `nombre`: nombre del empleado (string)
    - `salario_base`: salario base mensual (float)
    - `horas_extras`: número de horas extras trabajadas (integer)
  """

  def salario do
 # Pedimos los datos del empleado
    nombre = Util.input("Nombre del empleado", :string)
    salario_base = Util.input("Ingrese el salario base", :float)
    horas_extras = Util.input( "Ingrese las horas extras trabajadas", :integer)

# Calculamos el valor de la hora normal (suponiendo 240 horas/mes)
    valor_hora_normal = salario_base /240
# operaciones necesarias para calcular el pago total teniendo en cuenta las horas extras
    valor_hora_extra = valor_hora_normal * 1.5
    pago_horas_extras = horas_extras * valor_hora_extra
    salario_total = salario_base + pago_horas_extras
# Mostramos el resultado al usuario
    Util.show_message("""
    Empleado: #{nombre}
    Salario base: #{:erlang.float_to_binary(salario_base, decimals: 2)}
    Horas extras: #{:erlang.integer_to_binary(horas_extras)}
    El salario total de #{nombre} es de #{:erlang.float_to_binary(salario_total, decimals: 2)}
    """)

  end
end

# Ejecutamos la función principal al cargar el archivo
Salario.salario()
