# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Messages#send_quick_message
    class MessageSendQuickMessageParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute custom_message
      #   The custom message content to include in the template
      #
      #   @return [String]
      required :custom_message, String, api_name: :customMessage

      # @!attribute phone_number
      #   The phone number to send the message to, in international format (e.g.,
      #   +1234567890)
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute x_api_key
      #
      #   @return [String]
      required :x_api_key, String

      # @!attribute x_sender_id
      #
      #   @return [String]
      required :x_sender_id, String

      # @!method initialize(custom_message:, phone_number:, x_api_key:, x_sender_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::MessageSendQuickMessageParams} for more details.
      #
      #   @param custom_message [String] The custom message content to include in the template
      #
      #   @param phone_number [String] The phone number to send the message to, in international format (e.g., +1234567
      #
      #   @param x_api_key [String]
      #
      #   @param x_sender_id [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
