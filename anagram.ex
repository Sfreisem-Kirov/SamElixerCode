defmodule Repeater do
  def repeat({word , 0}), do: 0
  def repeat({word , num}) do
    repeat({word, num-1 })
    IO.puts(word)
  end
end
