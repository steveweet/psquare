# Psquare

TODO: Write a gem description

## Installation

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

TODO: Write usage instructions here

## Method and reasoning
 
My initial thoughts were

* this obviously needs some form of sieve. I know of the "sieve of eratosthenes" but there may well be others.
* The output sounds like the kind of multiplication square we used to use at school for learning our times tables. Maybe a Matrix
* How pretty should I make the output.
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




## Contributing

1. Fork it ( http://github.com/<my-github-username>/psquare/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
