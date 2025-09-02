defmodule Inventario do
  @moduledoc """
  El modulo ´Inventario´  permite determinar la el coste total del inventario
  disponible del libro seleccionado
  """

  @doc """
  Calcular coste de inventario de una biblioteca

  ## Parámetros
  -titulo_libro: nombre del libro
  -unidades_disponibles: cantidad de libros disponibles
  -precio_unitario: valor de cada libro
  """
  def inverio do

# Pedimos los datos al usuario
    titulo_libro = Util.input("Nombre del libro: ", :string)
    unidades_disponibles = Util.input("Ingresa la cantidad de unidades disponibles:", :integer)
    precio_unitario = Util.input("Ingresa el precio unitario", :float)

    coste_inventario = precio_unitario*unidades_disponibles

# Mostramos el resumen de inventario en pantalla
    Util.show_message("""
    -------Inventario del liblo-------
    Titulo del libro: #{titulo_libro}
    Unidades disponibles: #{:erlang.integer_to_binary(unidades_disponibles)}
    Precio unitario: #{:erlang.float_to_binary(precio_unitario, decimals: 2)}
    El libro #{titulo_libro} tiene #{:erlang.integer_to_binary(unidades_disponibles)} unidades con un valor #{:erlang.float_to_binary(coste_inventario, decimals: 2)}
    """)
  end

end
# Ejecutamos la función principal al cargar el archivo
Inventario.inverio()
