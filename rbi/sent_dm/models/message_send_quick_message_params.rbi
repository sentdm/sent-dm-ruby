# typed: strong

module SentDm
  module Models
    class MessageSendQuickMessageParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            SentDm::MessageSendQuickMessageParams,
            SentDm::Internal::AnyHash
          )
        end

      # The custom message content to include in the template
      sig { returns(String) }
      attr_accessor :custom_message

      # The phone number to send the message to, in international format (e.g.,
      # +1234567890)
      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(String) }
      attr_accessor :x_api_key

      sig { returns(String) }
      attr_accessor :x_sender_id

      sig do
        params(
          custom_message: String,
          phone_number: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The custom message content to include in the template
        custom_message:,
        # The phone number to send the message to, in international format (e.g.,
        # +1234567890)
        phone_number:,
        x_api_key:,
        x_sender_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            custom_message: String,
            phone_number: String,
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
