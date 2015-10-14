require 'spec_helper'

module Uphold
  describe Helpers do
    context '.undercored_key' do
      it 'underscores a key correctly' do
        underscored_key = Helpers.underscored_key(:firstName)

        expect(underscored_key).to eq :first_name
      end
    end

    context '.camelized_key' do
      it 'camelizes a key correctly' do
        camelized_key = Helpers.camelized_key(:first_name)

        expect(camelized_key).to eq :firstName
      end
    end

    context '.underscored_hash' do
      it 'underscores a hash correctly' do
        underscored_hash = Helpers.underscored_hash(firstName: 'name', email: 'email')

        expect(underscored_hash.keys).to match %i(first_name email)
      end
    end

    context '.camelized_hash' do
      it 'camelizes a hash correctly' do
        camelized_hash = Helpers.camelized_hash(first_name: 'name', email: 'email')

        expect(camelized_hash.keys).to match %i(firstName email)
      end
    end
  end
end
