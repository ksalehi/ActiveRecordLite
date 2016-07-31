def is_prime?(n)
  i = 2
  while i < n
    return false if n % i == 0
    i += 1
  end
  true
end

is_prime(15) == false
is_prime(7) == true
is_prime(23) == true 
