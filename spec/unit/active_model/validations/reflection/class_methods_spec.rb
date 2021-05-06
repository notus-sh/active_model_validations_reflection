# frozen_string_literal: true

RSpec.describe ActiveModel::Validations::Reflection::ClassMethods do
  subject(:model) { Mirror }

  describe '.validators_of_kinds' do
    context 'when called with a single kind' do
      it 'returns only validators of this kind' do
        validators = model.validators_of_kinds(:presence)
        expect(validators).to all(be_a(ActiveModel::Validations::PresenceValidator))
      end

      it 'returns all validators of this kind' do
        validators = model.validators_of_kinds(:presence)
        expect(validators.size).to eq(3)
      end
    end

    context 'when called with more than one kind' do
      it 'returns only validators of these kinds' do
        validators = model.validators_of_kinds(:presence, :numericality)
        expect(validators).to all(
          be_a(ActiveModel::Validations::PresenceValidator).or(be_a(ActiveModel::Validations::NumericalityValidator))
        )
      end

      it 'returns all validators of these kinds' do
        validators = model.validators_of_kinds(:presence, :numericality)
        expect(validators.size).to eq(4)
      end
    end
  end

  describe '.validators_on_of_kinds' do
    context 'when called with a single kind' do
      it 'returns only validators of this kind' do
        validators = model.validators_on_of_kinds(:reflectivity, :presence)
        expect(validators).to all(be_a(ActiveModel::Validations::PresenceValidator))
      end

      it 'returns all validators of this kind' do
        validators = model.validators_on_of_kinds(:reflectivity, :presence)
        expect(validators.size).to eq(1)
      end
    end

    context 'when called with more than one kind' do
      it 'returns only validators of these kinds' do
        validators = model.validators_on_of_kinds(:reflectivity, :presence, :numericality)
        expect(validators).to all(
          be_a(ActiveModel::Validations::PresenceValidator).or(be_a(ActiveModel::Validations::NumericalityValidator))
        )
      end

      it 'returns all validators of these kinds' do
        validators = model.validators_on_of_kinds(:reflectivity, :presence, :numericality)
        expect(validators.size).to eq(2)
      end
    end
  end
end
