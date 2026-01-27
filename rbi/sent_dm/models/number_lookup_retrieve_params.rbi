# typed: strong

module SentDm
  module Models
    class NumberLookupRetrieveParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::NumberLookupRetrieveParams, SentDm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :phone_number

      sig do
        params(
          phone_number: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(phone_number:, request_options: {})
      end

      sig do
        override.returns(
          { phone_number: String, request_options: SentDm::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
