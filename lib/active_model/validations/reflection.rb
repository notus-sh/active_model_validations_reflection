# frozen_string_literal: true

require 'active_support/concern'

module ActiveModel
  module Validations
    module Reflection
      extend ActiveSupport::Concern

      module ClassMethods
        def validators_of_kinds(*kinds)
          return validators if kinds.size.zero?

          validators.select do |validator|
            kinds.include?(validator.kind)
          end
        end

        def flat_validators_of_kinds(*kinds)
          validators_of_kinds(*kinds).select do |validator|
            !(validator.options.key?(:if) || validator.options.key?(:unless))
          end
        end

        def validators_on_of_kinds(attribute, *kinds)
          return validators_on(attribute) if kinds.size.zero?

          validators_on(attribute).select do |validator|
            kinds.include?(validator.kind)
          end
        end

        def flat_validators_on_of_kinds(attribute, *kinds)
          validators_on_of_kinds(attribute, *kinds).select do |validator|
            !(validator.options.key?(:if) || validator.options.key?(:unless))
          end
        end
      end
    end
  end
end
