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


  
end
#value_one = 13195
#IO.puts "Prime factors of #{value_one} are: #{PrimeFactor.prime_factors_of(value_one)} "

#value_two = 600851475143
#IO.puts "Prime factors of #{value_two} are: #{PrimeFactor.prime_factors_of(value_two)} "
