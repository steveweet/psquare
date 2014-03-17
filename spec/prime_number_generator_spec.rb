require 'spec_helper'
require './lib/prime_number_generator'

describe PrimeNumberGenerator do 

  before(:all) do
    @first_10 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] 
    @first_20 = @first_10 + [31, 37, 41, 43, 47, 53, 59, 61, 67, 71] 
  end


  describe "Using Trial Division" do
    
    subject { PrimeNumberGenerator.new }
    
    it "can get a specified number of values" do 
      expect(subject.trial_division(10).size).to eq(10) 
    end
    it "builds the correct set" do 
      expect(subject.trial_division(10)).to eq(@first_10) 
    end
  end

    describe "Using sieve of Eratosthenes" do
    
    subject { PrimeNumberGenerator.new }
    
    it "can get a specified number of values" do 
      expect(subject.sieve_of_eratosthenes(10).size).to eq(10) 
    end
    it "builds the correct set" do 
      expect(subject.sieve_of_eratosthenes(10)).to eq(@first_10) 
    end
    it "handles larger numbers" do 
      expect(subject.sieve_of_eratosthenes(20)).to eq(@first_20) 
    end
  end
  
end
