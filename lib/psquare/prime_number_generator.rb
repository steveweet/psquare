
class PrimeNumberGenerator

  # The trial division method of ascertaining primarity
  # From wikipedia http://en.wikipedia.org/wiki/Prime_number#Trial_division
  # The most basic method of checking the primality of a given integer n is called trial division. 
  # This routine consists of dividing n by each integer m that is greater than 1 and less than or equal to the square root of n. 
  # If the result of any of these divisions is an integer, then n is not a prime, otherwise it is a prime

  def trial_division(count)
    primes = [2, 3]
    candidate = primes[-1]
    while ( primes.size < count ) do
      candidate += 2
      next if primes.select{|prime| prime <= Math.sqrt(candidate)}.any? { |prime| candidate % prime == 0 }
      primes << candidate
    end
    primes
  end

  # http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  # The sieve of Eratosthenes, one of a number of prime number sieves, is a simple, ancient algorithm for finding all prime numbers up to any given limit.
  # It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2
  # The multiples of a given prime are generated as a sequence of numbers starting from that prime, with constant difference between them 
  # which is equal to that prime. This is the sieve's key distinction from using trial division to sequentially test each candidate number for 
  # divisibility by each prime.

  # For very large numbers this algorithm would have to be much cleverer. If we run out of sieve entries before we have found the required number 
  # of primes then this algorith is just doubling the last prime to determine how large to make the sieve. This would cause major issues for bigger
  # primes. The reason for the doubling is that "Betrand's Postulate" states that
  # "there is always a prime number between k and 2k"
  #
  # The sieve_size parameter is to prevent un-necessarily small sieve sizes when calculating the first few primes. The algorithm would be more elegant
  # without it but also more inefficient for small numbers of primes

  def sieve_of_eratosthenes(count, sieve_size = 50)
    primes = [2]
    while ( primes.size < count ) do
      start = primes[-1]
      finish = [start * 2, start + sieve_size].max
      sieve = (start..finish).to_a
      primes.each do | prime|
        sieve.delete_if {|item| item % prime == 0}
      end
      primes << sieve[0]
    end

    primes
  end


end
