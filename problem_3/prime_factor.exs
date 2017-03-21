defmodule PrimeFactor do
  def is_prime?(value) do
    check_prime(value, 2)
  end

  defp check_prime(2, _index) do
    true
  end
  defp check_prime(value, index) when rem(value, index) == 0 do
    false
  end
  defp check_prime(value, index) when (index * index) <= value do
    check_prime(value, index + 1)
  end
  defp check_prime(_value, _index) do
    true
  end

  defp largest_prime_factor(value, div) when div < value do
    cond do
      rem(value, div) == 0 ->
        largest_prime_factor(round(value/div), 2)
      true ->
        largest_prime_factor(value, div + 1)
    end
  end
  defp largest_prime_factor(value, _div) do
    value
  end

  def largest_prime_factor(value) do
    largest_prime_factor(value, 2)
  end

end
value_one = 13195
IO.puts "Largest prime factor of #{value_one} is: #{PrimeFactor.largest_prime_factor(value_one)} "

value_two = 600851475143
IO.puts "Largest prime factor of #{value_two} is: #{PrimeFactor.largest_prime_factor(value_two)} "
