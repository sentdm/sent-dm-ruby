# frozen_string_literal: true

module SentDm
  module Resources
    class Messages
      # Retrieves comprehensive details about a specific message using the message ID.
      # Returns complete message data including delivery status, channel information,
      # template details, contact information, and pricing. The customer ID is extracted
      # from the authentication token to ensure the message belongs to the authenticated
      # customer.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::MessageRetrieveResponse]
      #
      # @see SentDm::Models::MessageRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v2/messages/%1$s", id],
          model: SentDm::Models::MessageRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::MessageSendQuickMessageParams} for more details.
      #
      # Sends a message to a phone number using the default template. This endpoint is
      # rate limited to 5 messages per customer per day. The customer ID is extracted
      # from the authentication token.
      #
      # @overload send_quick_message(custom_message:, phone_number:, request_options: {})
      #
      # @param custom_message [String] The custom message content to include in the template
      #
      # @param phone_number [String] The phone number to send the message to, in international format (e.g., +1234567
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::MessageSendQuickMessageParams
      def send_quick_message(params)
        parsed, options = SentDm::MessageSendQuickMessageParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v2/messages/quick-message",
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::MessageSendToContactParams} for more details.
      #
      # Sends a message to a specific contact using a template. The message can be sent
      # via SMS or WhatsApp depending on the contact's capabilities. Optionally specify
      # a webhook URL to receive delivery status updates. The customer ID is extracted
      # from the authentication token.
      #
      # @overload send_to_contact(contact_id:, template_id:, template_variables: nil, request_options: {})
      #
      # @param contact_id [String] The unique identifier of the contact to send the message to
      #
      # @param template_id [String] The unique identifier of the template to use for the message
      #
      # @param template_variables [Hash{Symbol=>String}, nil] Optional key-value pairs of template variables to replace in the template body.
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::MessageSendToContactParams
      def send_to_contact(params)
        parsed, options = SentDm::MessageSendToContactParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v2/messages/contact",
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::MessageSendToPhoneParams} for more details.
      #
      # Sends a message to a phone number using a template. The phone number doesn't
      # need to be a pre-existing contact. The message can be sent via SMS or WhatsApp.
      # Optionally specify a webhook URL to receive delivery status updates. The
      # customer ID is extracted from the authentication token.
      #
      # @overload send_to_phone(phone_number:, template_id:, template_variables: nil, request_options: {})
      #
      # @param phone_number [String] The phone number to send the message to, in international format (e.g., +1234567
      #
      # @param template_id [String] The unique identifier of the template to use for the message
      #
      # @param template_variables [Hash{Symbol=>String}, nil] Optional key-value pairs of template variables to replace in the template body.
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::MessageSendToPhoneParams
      def send_to_phone(params)
        parsed, options = SentDm::MessageSendToPhoneParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v2/messages/phone",
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [SentDm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
