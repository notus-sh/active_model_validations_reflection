# frozen_string_literal: true

require_relative 'lib/active_model_validations_reflection/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_model_validations_reflection'
  spec.version       = ActiveModelValidationsReflection::VERSION
  spec.licenses      = ['Apache-2.0']
  spec.authors       = ['Gaël-Ian Havard']
  spec.email         = ['gael-ian@notus.sh']

  spec.summary       = 'ActiveModel extension on validations reflection'
  spec.description   = 'An ActiveModel extension for more expressive validations reflection'
  spec.homepage      = 'https://github.com/notus-sh/active_model_validations_reflection'

  raise 'RubyGems 2.0 or newer is required.' unless spec.respond_to?(:metadata)

  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',

    'bug_tracker_uri' => 'https://github.com/notus-sh/active_model_validations_reflection/issues',
    'changelog_uri' => 'https://github.com/notus-sh/active_model_validations_reflection/blob/master/CHANGELOG.md',
    'homepage_uri' => 'https://github.com/notus-sh/active_model_validations_reflection',
    'source_code_uri' => 'https://github.com/notus-sh/active_model_validations_reflection',
    'funding_uri' => 'https://opencollective.com/notus-sh'
  }

  spec.require_paths = ['lib']

  excluded_dirs = %r{^(.github|dev|spec)/}
  excluded_files = %w[.gitignore .rspec .rubocop.yml Gemfile Gemfile.lock Rakefile]
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(excluded_dirs) || excluded_files.include?(f)
  end

  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.add_dependency  'activemodel',    '>= 3.2'
  spec.add_dependency  'activesupport',  '>= 3.2'

  spec.add_development_dependency 'bundler',  '~> 2.1'
  spec.add_development_dependency 'rake',     '~> 13.0'
  spec.add_development_dependency 'rspec',    '~> 3.12.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
end
