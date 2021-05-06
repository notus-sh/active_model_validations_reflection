# frozen_string_literal: true

RSpec.describe ActiveModel::Validations::Reflection, '#relevant_validators_on' do
  subject(:record) { Mirror.new }

  it 'always returns validators without conditions' do
    validators = record.relevant_validators_on(:shape)
    expect(validators.size).to eq(2)
  end

  it 'can filter validators by kind' do
    validators = record.relevant_validators_on(:shape, :inclusion)
    expect(validators.size).to eq(1)
  end

  it 'does not return irrelevant validators' do
    validators = record.relevant_validators_on(:flatness, :format)
    expect(validators).to be_empty
  end

  it 'returns only relevant validators' do
    record.shape = :square
    validators = record.relevant_validators_on(:flatness, :format)
    expect(validators).not_to be_empty
  end
end
