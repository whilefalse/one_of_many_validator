# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.authors       = ["Steven Anderson"]
  gem.email         = ["steve@whilefalse.net"]
  gem.description   = <<-DESC
Provides a OneOfManyValidator for Rails validation.

This allows you to validate that one of a set of fields should be required, but
no particular field itself is required.
DESC
gem.summary       = %q{Provides validation for when one of a set of fields is required.}
  gem.homepage      = "http://github.com/whilefalse/one_of_many_validator"

  gem.files         = %w{lib/one_of_many_validator.rb}
  gem.test_files    = %w{spec/one_of_many_validator_spec.rb}
  gem.name          = "one_of_many_validator"
  gem.require_paths = ["lib"]
  gem.version       = '0.1'

  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rspec'
  gem.add_dependency 'activemodel'
end
