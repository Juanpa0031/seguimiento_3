defmodule Salario do
  def salario do

    nombre = Util.input("Nombre del empleado", :string)
    salario_base = Util.input("Ingrese el salario base", :float)
    horas_extras = Util.input( "Ingrese las horas extras trabajadas", :integer)


    valor_hora_normal = salario_base /240
    valor_hora_extra = valor_hora_normal * 1.5
    pago_horas_extras = horas_extras * valor_hora_extra
    salario_total = salario_base + pago_horas_extras

    Util.show_message("""
    Empleado: #{nombre}
    Salario base: #{:erlang.float_to_binary(salario_base, decimals: 2)}
    Horas extras: #{:erlang.integer_to_binary(horas_extras)}
    El salario total de #{nombre} es de #{:erlang.float_to_binary(salario_total, decimals: 2)}
    """)

  end
end

Salario.salario()
