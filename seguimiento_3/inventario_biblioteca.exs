defmodule Inventario do
  def inverio do

    titulo_libro = Util.input("Nombre del libro: ", :string)
    unidades_disponibles = Util.input("Ingresa la cantidad de unidades disponibles:", :integer)
    precio_unitario = Util.input("Ingresa el precio unitario", :float)

    coste_inventario = precio_unitario*unidades_disponibles

    Util.show_message("""
    -------Inventario del liblo-------
    Titulo del libro: #{titulo_libro}
    Unidades disponibles: #{:erlang.integer_to_binary(unidades_disponibles)}
    Precio unitario: #{:erlang.float_to_binary(precio_unitario, decimals: 2)}
    El libro #{titulo_libro} tiene #{:erlang.integer_to_binary(unidades_disponibles)} unidades con un valor #{:erlang.float_to_binary(coste_inventario, decimals: 2)}
    """)
  end

end
Inventario.inverio()
