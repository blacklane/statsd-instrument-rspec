# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "statsd/instrument/rspec/version"

Gem::Specification.new do |spec|
  spec.name          = "statsd-instrument-rspec"
  spec.version       = Statsd::Instrument::Rspec::VERSION
  spec.authors       = ["Philipp Preß"]
  spec.email         = ["philipp.press@blacklane.com"]

  spec.summary       = "RSpec 3 matchers for statsd-instrument."
  spec.homepage      = "https://github.com/blacklane/statsd-instrument-rspec"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0"

  spec.add_runtime_dependency "rspec",             "~> 3.0"
  spec.add_runtime_dependency "statsd-instrument", "~> 2.0"

  spec.add_development_dependency "bundler",           "~> 1.8"
  spec.add_development_dependency "coveralls",         "~> 0.7"
  spec.add_development_dependency "pry",               "~> 0.10"
  spec.add_development_dependency "rake",              "~> 10.0"
  spec.add_development_dependency "rubocop",           "~> 0.29"
  spec.add_development_dependency "rubocop-rspec",     "~> 1.0"
  spec.add_development_dependency "simplecov",         "~> 0.9"
end
