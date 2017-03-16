defmodule FibEvens do
  require Integer

  def next_fibtuple({x, y}) do
    z = x + y
    {z, z + y}
  end

  def fib_tuples({x, y}, list, max) when (y >= max) do
    list ++ [{x,0}]
  end

  def fib_tuples(first, list, max) do
    list = list ++ [first]
    {x, y} = next_fibtuple(first)
      fib_tuples({x,y}, list, max)
  end

  def fib_tuples(max) do
    fib_tuples({1,1}, [], max)
  end

  def sum_even_fibs(max) do
    fib_tuples(max)
    |> Enum.reduce([], fn (tup, acc) -> acc ++ Tuple.to_list tup end)
    |> Enum.filter(fn n -> Integer.is_even n end)
    |> Enum.sum
  end

end

max_fib_value = 4000000

#print fib tuples
FibEvens.fib_tuples(max_fib_value)
|> Enum.each(fn {x,y} -> IO.puts("{#{x}, #{y}}") end)

#calculate the sum of the even fib values under max
sum = FibEvens.sum_even_fibs(max_fib_value)
IO.puts "Sum of even fibonacci values up to #{max_fib_value} = #{sum}"
