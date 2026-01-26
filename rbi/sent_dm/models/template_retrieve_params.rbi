# typed: strong

module SentDm
  module Models
    class TemplateRetrieveParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateRetrieveParams, SentDm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :x_api_key

      sig { returns(String) }
      attr_accessor :x_sender_id

      sig do
        params(
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(x_api_key:, x_sender_id:, request_options: {})
      end

      sig do
        override.returns(
          {
            x_api_key: String,
            x_sender_id: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
