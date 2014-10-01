# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "possessify/version"

Gem::Specification.new do |s|
  s.name        = "possessify"
  s.version     = Possessify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Busse"]
  s.email       = ["dpb@essub.com"]
  s.homepage    = "http://github.com/dpbus/possessify"
  s.summary     = %q{Possessify extends the Ruby String class adding functionality to make strings possessive and non-possessive.}
  s.description = %q{Possessify extends the Ruby String class adding functionality to make strings possessive and non-possessive. Methods include possessive, non_possessive, and possessive?}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'minitest', '~> 5.4.2'
end
