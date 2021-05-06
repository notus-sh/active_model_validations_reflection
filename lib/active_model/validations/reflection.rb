# frozen_string_literal: true

require 'active_support/concern'

module ActiveModel
  module Validations
    module Reflection
      extend ActiveSupport::Concern

      module ClassMethods
        def validators_of_kinds(*validator_kinds)
          validators.select do |validator|
            validator_kinds.include?(validator.kind)
          end
        end

        def validators_on_of_kinds(attribute, *validator_kinds)
          validators_on(attribute).select do |validator|
            validator_kinds.include?(validator.kind)
          end
        end
      end
    end
  end
end
