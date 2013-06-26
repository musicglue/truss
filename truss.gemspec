# -*- encoding: utf-8 -*-
require File.expand_path('../lib/truss/version', __FILE__)

Gem::Specification.new do |gem|
    gem.authors       = ["JGW Maxwell"]
    gem.email         = ["john@musicglue.com"]
    gem.description   = %q{Truss is a Rack based framework that creates Rack endpoints with a nice DSL}
    gem.summary       = %q{Rack application builder}
    gem.homepage      = "http://truss-io.github.io"

    gem.files         = `git ls-files`.split($\)
    gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
    gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
    gem.name          = "truss"
    gem.require_paths = ["lib"]
    gem.version       = Truss::VERSION

    gem.add_development_dependency    "activesupport", "~> 4.0.0"
    gem.add_development_dependency    "thor",          "~> 0.18.1"

    gem.add_dependency      "rack",         "~> 1.5.0"
    gem.add_dependency      "truss-router", "~> 0.0.5"
end
