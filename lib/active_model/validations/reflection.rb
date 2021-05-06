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

        def validators_on_of_kinds(attribute, *kinds)
          return validators_on(attribute) if kinds.size.zero?

          validators_on(attribute).select do |validator|
            kinds.include?(validator.kind)
          end
        end
      end
    end
  end
end
