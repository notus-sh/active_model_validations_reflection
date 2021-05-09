# ActiveModel::Validations::Reflection

[![Build Status](https://travis-ci.com/notus-sh/active_model_validations_reflection.svg?branch=master)](https://travis-ci.com/notus-sh/active_model_validations_reflection)
[![Gem Version](https://badge.fury.io/rb/active_model_validations_reflection.svg)](https://badge.fury.io/rb/active_model_validations_reflection)

`ActiveModel::Validations::Reflection` extends `ActiveModel` reflection capabilities on validations.

## Installation

`ActiveModel::Validations::Reflection` is distributed as a gem and available on [rubygems.org](https://rubygems.org/gems/active_model_validations_reflection) so you can add it to your `Gemfile` or install it manually with:

```ruby
gem install active_model_validations_reflection
```

## Usage

`ActiveModel`, at least since 3.0, provide a basic mechanism to inspect validations on a model through [`ActiveModel::Validations::ClassMethods#validators`](https://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validators) and [`ActiveModel::Validations::ClassMethods#validators_on`](https://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validators_on).

This extends it with easier filtering on validators on class level and contextual filtering on instance level.

### `.validators_of_kinds(*kinds)` & `.validators_on_of_kinds(attribute, *kinds)`

`.validators_of_kinds` & `.validators_on_of_kinds` are class methods to filter validators by kind, respectively on all or a single attribute.

Any kind supported by [`validates`](https://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validates) (`:presence` , `:inclusion`, `:uniqueness`, or custom validator's kind) can be used to filter validators.

```ruby
class Article < ApplicationRecord
  include ActiveModel::Validations::Reflection
  
  validates :date,
            presence: true,
            timeliness: { type: :date }
end

Article.validators_of_kinds(:presence)
# => [#<ActiveModel::Validations::PresenceValidator […]>]
Article.validators_on_of_kinds(:date, :timeliness)
# => [#<ValidatesTimeliness::Validator […]>]
```

### `.flat_validators_of_kinds(*kinds)` & `.flat_validators_on_of_kinds(attribute, *kinds)`

Same as the above two but only return validators without conditions (`:if` / `:unless`).

```ruby
class Article < ApplicationRecord
  include ActiveModel::Validations::Reflection
  
  enum :status, %i[draft published]
  
  validates :date,
            presence: true,
            timeliness: { type: :date, if: :published? }
end

Article.validators_of_kinds(:presence)
# => [#<ActiveModel::Validations::PresenceValidator […]>]
Article.validators_on_of_kinds(:date, :timeliness)
# => []
```

### `#relevant_validators(*kinds)` & `#relevant_validators_on(attribute, *kinds)`

Returns validator that will be applied considering the instance current state: flat validators and conditional validators whose condition is met.  

```ruby
class Article < ApplicationRecord
  include ActiveModel::Validations::Reflection
  
  enum :status, %i[draft published]
  
  validates :date,
            presence: true,
            timeliness: { type: :date, if: :published? }
end

article = Article.new
article.relevant_validators
# => [#<ActiveModel::Validations::PresenceValidator […]>]
article.relevant_validators_on(:date)
# => [#<ActiveModel::Validations::PresenceValidator […]>]

article.status = :published
article.relevant_validators_on(:date)
# => [#<ActiveModel::Validations::PresenceValidator […]>, #<ValidatesTimeliness::Validator […]>]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/notus-sh/active_model_validations_reflection>.
