# typed: strong

module Sentdm
  module Models
    class ContactRetrieveMessageSummaryParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Sentdm::ContactRetrieveMessageSummaryParams,
            Sentdm::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :contact_id

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          contact_id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(contact_id:, x_profile_id: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            contact_id: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
