# Yup, this works.
#
# A couple of questions: 
# 
# * you put the two arguments into a tuple, rather than just having
#   two separate variables. This isn't right or wrong. But think
#   about the difference between the two. Are there cases where
#   one would be more appropriate than the other?
#
# * Inside the `repeat` function you have the recursive call,
#   then call `puts`.
#
#   Imagine the `puts` line was changed to `IO.puts("#{num}: #{word}")`
#   What output would you see?
#
#   Now move the `puts` call before the recursive call to `repeat`.
#   How would this change the output?
# 

defmodule Repeater do
  def repeat({word , 0}), do: 0
  def repeat({word , num}) do
    repeat({word, num-1 })
    IO.puts(word)
  end
end
