defmodule Util do
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  def input(message, :string) do
    System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
    |> elem(0)
    |> String.trim()
  end
  def input(message, :integer) do
  case System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
       |> elem(0)
       |> String.trim()
       |> Integer.parse() do
    {int, _} -> int
    :error -> {:error, "No es un número válido"}
  end
  end

  def input(message, :float) do
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", message])
         |> elem(0)
         |> String.trim()
         |> Float.parse() do
      {float, _} -> float
      :error ->
        show_message("Error: Ingrese un número válido")
        input(message, :float)
      end
    end
end
