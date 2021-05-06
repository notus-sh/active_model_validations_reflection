# frozen_string_literal: true

RSpec.describe ActiveModel::Validations::Reflection::ClassMethods, '.flat_validators_on_of_kinds' do
  subject(:model) { Mirror }

  it 'returns validators without conditions' do
    expect(model.flat_validators_on_of_kinds(:reflectivity, :presence)).not_to be_empty
  end

  it 'does not return validators with conditions' do
    expect(model.flat_validators_on_of_kinds(:reflectivity, :inclusion)).to be_empty
  end
end
