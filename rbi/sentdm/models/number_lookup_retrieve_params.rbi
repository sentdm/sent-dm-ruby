# typed: strong

module Sentdm
  module Models
    class NumberLookupRetrieveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::NumberLookupRetrieveParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :phone_number

      sig do
        params(
          phone_number: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(phone_number:, request_options: {})
      end

      sig do
        override.returns(
          { phone_number: String, request_options: Sentdm::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
