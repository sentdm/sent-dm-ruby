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

      # @!method initialize(custom_message:, phone_number:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::MessageSendQuickMessageParams} for more details.
      #
      #   @param custom_message [String] The custom message content to include in the template
      #
      #   @param phone_number [String] The phone number to send the message to, in international format (e.g., +1234567
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
