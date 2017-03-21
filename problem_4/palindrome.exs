defmodule Palindrome do
  def find_largest_palindrome() do
    999..1
    |> Enum.flat_map(fn n ->
      Enum.map(n..1, fn i -> i*n end)
    end)
    |> Enum.filter(fn p -> palindrome?(p) end)
    |> Enum.max
  end

  def palindrome?(value) do
    as_string = Integer.to_string(value)
    as_string == String.reverse(as_string)
  end

end

lp = Palindrome.find_largest_palindrome()
IO.puts("Largest palindrome nr for the multiple of 2 three-digit numbers is: #{lp}")
