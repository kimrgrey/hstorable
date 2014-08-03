# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hstorable/version'

Gem::Specification.new do |spec|
  spec.name          = "hstorable"
  spec.version       = Hstorable::VERSION
  spec.authors       = ["Sergey Tsvetkov"]
  spec.email         = ["sergey.a.tsvetkov@gmail.com"]
  spec.summary       = %q{This gem simplifies working wih fields stored using Hstore}
  spec.description   = %q{This gem simplifies working wih fields stored using Hstore}
  spec.homepage      = "http://hstorable.kimrgrey.org/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.3"

  spec.add_runtime_dependency "pg", "0.17.1"
end
