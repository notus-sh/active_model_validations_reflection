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
              in: 1.0..100.0,
              unless: :square?
            }

  validates :shape,
            presence: true,
            inclusion: {
              in: %i[square cylinder sphere]
            }

  validates :flatness,
            if: :square?,
            presence: true,
            format: {
              with: /\A[0-9]+-[0-9]+µm\z/
            }

  def square?
    shape == :square
  end
end
