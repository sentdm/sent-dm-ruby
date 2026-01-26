# typed: strong

module SentDm
  module Models
    class ContactRetrieveIDParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::ContactRetrieveIDParams, SentDm::Internal::AnyHash)
        end

      # The unique identifier (GUID) of the resource to retrieve
      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :x_api_key

      sig { returns(String) }
      attr_accessor :x_sender_id

      sig do
        params(
          id: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier (GUID) of the resource to retrieve
        id:,
        x_api_key:,
        x_sender_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
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
