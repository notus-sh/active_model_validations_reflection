# ActiveModel::Validations::Reflection

[![Build Status](https://travis-ci.org/notus-sh/active_model_validations_reflection.svg?branch=master)](https://travis-ci.org/notus-sh/active_model_validations_reflection)
[![Gem Version](https://badge.fury.io/rb/active_model_validations_reflection.svg)](https://badge.fury.io/rb/active_model_validations_reflection)

`ActiveModel::Validations::Reflection` extends `ActiveModel` reflection capabilities on validations.

## Installation

`Rack::AddressMunging` is distributed as a gem and available on [rubygems.org](https://rubygems.org/gems/rack-address_munging) so you can add it to your `Gemfile` or install it manually with:

```ruby
gem install active_model_validations_reflection
```

## Usage

`ActiveModel`, at least since 3.0, provide a basic mechanism to inspect validations on a model through [`ActiveModel::Validations::ClassMethods#validators`](https://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validators) and [`ActiveModel::Validations::ClassMethods#validators_on`](https://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validators_on).

This extends it with easier filtering on validators on class level and contextual filtering on instance level.


## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/notus-sh/active_model_validations_reflection>.
