# frozen_string_literal: true

require 'active_support/concern'

module ActiveModel
  module Validations
    module Reflection # :nodoc:
      extend ActiveSupport::Concern

      module Helpers # :nodoc:
        class << self
          def flat_validator?(validator)
            !(validator.options.key?(:if) || validator.options.key?(:unless))
          end

          def relevant_validator?(validator, instance)
            condition = validator.options.key?(:if) ? validator.options[:if] : validator.options[:unless]
            result = evaluate_condition(condition, instance)

            (validator.options.key?(:unless) ? !result : !!result)
          end

          def evaluate_condition(condition, instance)
            return condition.call(instance) if condition.respond_to?(:call)
            return instance.send(condition) if condition.is_a?(::Symbol) && instance.respond_to?(condition)

            condition
          end
        end
      end

      module ClassMethods # :nodoc:
        def validators_of_kinds(*kinds)
          return validators if kinds.empty?

          validators.select do |validator|
            kinds.include?(validator.kind)
          end
        end

        def flat_validators_of_kinds(*kinds)
          validators_of_kinds(*kinds).select do |validator|
            Helpers.flat_validator?(validator)
          end
        end

        def validators_on_of_kinds(attribute, *kinds)
          return validators_on(attribute) if kinds.empty?

          validators_on(attribute).select do |validator|
            kinds.include?(validator.kind)
          end
        end

        def flat_validators_on_of_kinds(attribute, *kinds)
          validators_on_of_kinds(attribute, *kinds).select do |validator|
            Helpers.flat_validator?(validator)
          end
        end
      end

      def relevant_validators(*kinds)
        self.class.validators_of_kinds(*kinds).select do |validator|
          next true if Helpers.flat_validator?(validator)

          Helpers.relevant_validator?(validator, self)
        end
      end

      def relevant_validators_on(attribute, *kinds)
        self.class.validators_on_of_kinds(attribute, *kinds).select do |validator|
          next true if Helpers.flat_validator?(validator)

          Helpers.relevant_validator?(validator, self)
        end
      end
    end
  end
end
