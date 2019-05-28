# frozen_string_literal: true

require 'spec_helper'

describe Uphold::Entities::BaseEntity do
  class MockEntity < Uphold::Entities::BaseEntity
    attribute :a_key
  end

  context '#initialize' do
    it 'instantiates instance variables from arguments' do
      entity = MockEntity.new(a_key: 'value')

      expect(entity.a_key).to eq 'value'
    end

    it 'converts camelCase to snake_case' do
      entity = MockEntity.new(a_key: 'value')

      expect(entity.a_key).to eq 'value'
    end
  end

  context '#error?' do
    it 'is false for non-error entities' do
      entity = Uphold::Entities::User.new

      expect(entity.error?).to be_falsey
    end

    it 'is true for error entities' do
      entity = Uphold::Entities::Error.new

      expect(entity.error?).to be_truthy
    end
  end

  context '.from_collection' do
    it 'instantiates each of the entities passed in' do
      h = double(Hash)
      entity = double('Entity', to_h: h)
      allow(MockEntity).to receive(:new)

      MockEntity.from_collection([entity], '0-1/10')

      expect(MockEntity).to have_received(:new).with(h)
    end
  end
end
