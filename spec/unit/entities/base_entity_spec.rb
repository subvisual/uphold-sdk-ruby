require 'spec_helper'

module Bitreserve
  module Entities
    describe BaseEntity do
      context '#initialize' do
        it 'instantiates instance variables from arguments' do
          entity = BaseEntity.new(key: 'value')

          expect(entity.instance_variable_get(:@key)).to eq 'value'
        end

        it 'converts camelCase to snake_case' do
          entity = BaseEntity.new(someKey: 'value')

          expect(entity.instance_variable_get(:@some_key)).to eq 'value'
        end
      end

      context '.from_collection' do
        it 'instantiates each of the entities passed in' do
          entity = double('Entity')
          allow(BaseEntity).to receive(:new)

          BaseEntity.from_collection([entity])

          expect(BaseEntity).to have_received(:new).with(entity)
        end
      end
    end
  end
end
