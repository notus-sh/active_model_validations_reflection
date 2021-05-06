# frozen_string_literal: true

RSpec.describe ActiveModel::Validations::Reflection::ClassMethods, '.validators_of_kinds' do
  subject(:model) { Mirror }

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
