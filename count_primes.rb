# Sieve of Eratosthenes
# program to print all primes smaller than or equal to n

def count_primes(n)
  prime_numbers = Array.new(n, true)
  prime_numbers[0] = prime_numbers[1] = false
  
  (2..n).each do |i|
    if prime_numbers[i]
      (i * i..n).step(i).each do |j|
        prime_numbers[j] = false
      end
    end
  end
  
  prime_numbers.count(true)
end