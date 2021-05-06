# frozen_string_literal: true

class Mirror
  include ActiveModel::Validations
  include ActiveModel::Validations::Reflection

  attr_accessor :reflectivity, :shape, :flatness

  validates :reflectivity,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100
            },
            inclusion: {
              in: 1.0..100.0
            }

  validates :shape,
            presence: true,
            inclusion: {
              in: %i[square cylinder sphere]
            }

  validates :flatness,
            presence: { if: :square }
end
