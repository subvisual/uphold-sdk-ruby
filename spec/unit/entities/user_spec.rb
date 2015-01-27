require 'spec_helper'

module Bitreserve
  module Entities
    describe User do
      shared_examples 'a collectionable attribute' do |klass|
        attribute_name = klass.to_s.split('::').last.downcase
        attribute_name_plural = attribute_name + 's'

        it "gets all #{attribute_name} entities from a collection" do
          attribute = double(attribute_name_plural)
          user = User.new attribute_name_plural => attribute
          allow(klass).to receive(:from_collection)

          user.public_send(attribute_name_plural)

          expect(klass).to have_received(:from_collection).with(attribute)
        end
      end

      it_behaves_like 'a collectionable attribute', Phone
      it_behaves_like 'a collectionable attribute', Card
      it_behaves_like 'a collectionable attribute', Transaction
    end
  end
end
