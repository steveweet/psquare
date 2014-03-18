require 'benchmark'
require 'psquare'


Benchmark.bmbm(25) do |x|
  
  
  n = 100
  s = 50
  x.report("sieve_nil:     #{n}*#{s}") { n.times do   ; PrimeNumberGenerator.new.sieve_of_eratosthenes_nil(s); end }
  x.report("sieve_delete:  #{n}*#{s}") { n.times do   ; PrimeNumberGenerator.new.sieve_of_eratosthenes_delete(s); end }
  x.report("trial_division:#{n}*#{s}") { n.times do ; PrimeNumberGenerator.new.trial_division(s); end }
  
  n = 500
  s = 50
  x.report("sieve_nil:     #{n}*#{s}") { n.times do   ; PrimeNumberGenerator.new.sieve_of_eratosthenes_nil(s); end }
  x.report("sieve_delete:  #{n}*#{s}") { n.times do   ; PrimeNumberGenerator.new.sieve_of_eratosthenes_delete(s); end }
  x.report("trial_division:#{n}*#{s}") { n.times do ; PrimeNumberGenerator.new.trial_division(s); end }
  
end