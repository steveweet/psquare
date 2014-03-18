
require "psquare/version"
require 'psquare/multiplication_square'
require 'psquare/prime_number_generator'

module Psquare
  # Your code goes here...

  def run(count)

    m = MultiplicationSquare.new PrimeNumberGenerator.new.trial_division(count)
    m.display
  end
end
