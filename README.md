# Psquare

Generates multiplication squares of prime numbers.

## Installation

Fork the repository from github and then build the gem using

    gem build psquare.gemspec
    gem install psquare-0.0.1.gem

Add this line to your application's Gemfile:

    gem 'psquare'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install psquare

## Description

This gem is created as the simplest way to deploy an interview question. The original question was as follows


> Write a program that calculates and prints out a multiplication table of the first 10 calculated prime numbers.
>
> Detail: The program must run from the command line and print to screen 1 table.
> Across the top and down the left side should be the 10 primes, and the body of the table should contain the product of multiplying these numbers.
> 
> Please include tests.
>
> Think about cases where the code doesn't know the upper limit (maybe it's 30 and not 10 primes?)
> Think about code complexity.
> Don't use the Ruby prime method.

> Impress me :-)


## Usage

The gem includes an executable script psquare with one optional argument of a count

    psquare psquare [-c number | --count number ] [ -h | --help]
      number::
        The number of primes to generate


## Method and reasoning
 
My initial thoughts were

* this obviously needs some form of sieve. I know of the "sieve of eratosthenes" but there may well be others.
* The output sounds like the kind of multiplication square we used to use at school for learning our times tables. Maybe a Matrix
* How pretty should I make the output?
* The best way to get the code to the reviewer would be from github would a gem be easier.
* I should examine the methods of bulding the primes and benchmark them for performance.

### Trivial implementation

A trivial implementation (Ignoring the instruction not to use the ruby Prime method ) would be something like this

    require 'matrix'
    require 'prime'

    primes = Prime.take(10)
    grid = Matrix.build(10) {|row,col| primes[row] * primes[col]}.to_a
    puts "\t" + primes.join("\t")
    grid.each_with_index do |row,index|
        puts primes[index].to_s + "\t" + row.join("\t")
    end

    This produces the following output

        2   3   5   7   11  13  17  19  23  29
    2   4   6   10  14  22  26  34  38  46  58
    3   6   9   15  21  33  39  51  57  69  87
    5   10  15  25  35  55  65  85  95  115 145
    7   14  21  35  49  77  91  119 133 161 203
    11  22  33  55  77  121 143 187 209 253 319
    13  26  39  65  91  143 169 221 247 299 377
    17  34  51  85  119 187 221 289 323 391 493
    19  38  57  95  133 209 247 323 361 437 551
    23  46  69  115 161 253 299 391 437 529 667
    29  58  87  145 203 319 377 493 551 667 841

### Benchmarks

The following benchmarks were generated for the trial division method and both of the different implemenations of the sieve

                                     user     system      total        real
     sieve_nil:     100*50       5.220000   0.000000   5.220000 (  5.226921)
     sieve_delete:  100*50       1.400000   0.000000   1.400000 (  1.403900)
     trial_division:100*50       0.580000   0.000000   0.580000 (  0.576762)
     sieve_nil:     500*50       5.220000   0.000000   5.220000 (  5.228985)
     sieve_delete:  500*50       1.410000   0.000000   1.410000 (  1.409036)
     trial_division:500*50       0.580000   0.000000   0.580000 (  0.576794)

The trial division is significantly faster for these small numbers of primes. The sieve themods that sets the struck out values to nil is also signifcantly
slower than the method that deletes from the array.

### Improvements

The implementation is a long way from ideal and for larger numbers of primes would become both slow and in some instances unworkable altogether. If implementing this for a real solution I would probably look at a singleton instance and/or class methods in much the same way the existing ruby prime class does. This would save the constant building of the prime array when it could be memoized and stored for later invocations to make use of.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/psquare/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
