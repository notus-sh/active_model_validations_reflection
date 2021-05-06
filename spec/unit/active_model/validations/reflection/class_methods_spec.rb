# frozen_string_literal: true

RSpec.describe ActiveModel::Validations::Reflection::ClassMethods do
  subject(:model) { Mirror }

  describe '.validators_of_kinds' do
    context 'when called with no kind' do
      it 'returns validators of any kind' do
        validators = model.validators_of_kinds
        expect(validators).to all(be_a(ActiveModel::EachValidator))
      end

      it 'returns all validators of any kind' do
        validators = model.validators_of_kinds
        expect(validators.size).to eq(7)
      end
    end

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

  describe '.flat_validators_of_kinds' do
    it 'returns validators without conditions' do
      expect(model.flat_validators_of_kinds(:numericality)).not_to be_empty
    end

    it 'does not return validators with conditions' do
      expect(model.flat_validators_of_kinds(:format)).to be_empty
    end
  end

  describe '.validators_on_of_kinds' do
    it 'returns only validators on attribute' do
      validators = model.validators_on_of_kinds(:reflectivity)
      attributes = validators.collect(&:attributes).flatten.uniq
      expect(attributes).to eq([:reflectivity])
    end

    context 'when called with no kind' do
      it 'returns validators of any kind' do
        validators = model.validators_on_of_kinds(:reflectivity)
        expect(validators).to all(be_a(ActiveModel::EachValidator))
      end

      it 'returns all validators of any kind' do
        validators = model.validators_on_of_kinds(:reflectivity)
        expect(validators.size).to eq(3)
      end
    end

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

  describe '.flat_validators_on_of_kinds' do
    it 'returns validators without conditions' do
      expect(model.flat_validators_on_of_kinds(:reflectivity, :presence)).not_to be_empty
    end

    it 'does not return validators with conditions' do
      expect(model.flat_validators_on_of_kinds(:reflectivity, :inclusion)).to be_empty
    end
  end
end
