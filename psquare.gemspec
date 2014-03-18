# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'psquare/version'

Gem::Specification.new do |spec|
  spec.name          = "psquare"
  spec.version       = Psquare::VERSION
  spec.authors       = ["sweet"]
  spec.email         = ["steveweet@gmail.com"]
  spec.summary       = %q{Display a multiplication table of the first 10 primes.}
  spec.description   = %q{Display on STDOUT multiplication tables of the first x primes.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.executables   = "psquare"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
