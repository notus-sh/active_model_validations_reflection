# frozen_string_literal: true

require_relative "lib/active_model_validations_reflection/version"

Gem::Specification.new do |spec|
  spec.name          = "active_model_validations_reflection"
  spec.version       = ActiveModelValidationsReflection::VERSION
  spec.licenses      = ['Apache-2.0']
  spec.authors       = ['Gaël-Ian Havard']
  spec.email         = ['gael-ian@notus.sh']

  spec.summary       = "ActiveModel extension on validations reflection"
  spec.description   = "An ActiveModel extension for more expressive validations reflection"
  spec.homepage      = "https://github.com/notus-sh/active_model_validations_reflection"

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.add_dependency  "activesupport",  "~> 3.2"
  spec.add_dependency  "activemodel",    "~> 3.2"

  spec.add_development_dependency 'bundler',  '~> 2.1'
  spec.add_development_dependency 'rake',     '~> 13.0'
  spec.add_development_dependency 'rspec',    '~> 3.10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
end
