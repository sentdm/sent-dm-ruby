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
      # @overload retrieve(id, x_api_key:, x_sender_id:, request_options: {})
      #
      # @param id [String]
      # @param x_api_key [String]
      # @param x_sender_id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::MessageRetrieveResponse]
      #
      # @see SentDm::Models::MessageRetrieveParams
      def retrieve(id, params)
        parsed, options = SentDm::MessageRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v2/messages/%1$s", id],
          headers: parsed.transform_keys(x_api_key: "x-api-key", x_sender_id: "x-sender-id"),
          model: SentDm::Models::MessageRetrieveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::MessageSendQuickMessageParams} for more details.
      #
      # Sends a message to a phone number using the default template. This endpoint is
      # rate limited to 5 messages per customer per day. The customer ID is extracted
      # from the authentication token.
      #
      # @overload send_quick_message(custom_message:, phone_number:, x_api_key:, x_sender_id:, request_options: {})
      #
      # @param custom_message [String] Body param: The custom message content to include in the template
      #
      # @param phone_number [String] Body param: The phone number to send the message to, in international format (e.
      #
      # @param x_api_key [String] Header param
      #
      # @param x_sender_id [String] Header param
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::MessageSendQuickMessageParams
      def send_quick_message(params)
        parsed, options = SentDm::MessageSendQuickMessageParams.dump_request(params)
        header_params = {x_api_key: "x-api-key", x_sender_id: "x-sender-id"}
        @client.request(
          method: :post,
          path: "v2/messages/quick-message",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
      # @overload send_to_contact(contact_id:, template_id:, x_api_key:, x_sender_id:, template_variables: nil, request_options: {})
      #
      # @param contact_id [String] Body param: The unique identifier of the contact to send the message to
      #
      # @param template_id [String] Body param: The unique identifier of the template to use for the message
      #
      # @param x_api_key [String] Header param
      #
      # @param x_sender_id [String] Header param
      #
      # @param template_variables [Hash{Symbol=>String}, nil] Body param: Optional key-value pairs of template variables to replace in the tem
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::MessageSendToContactParams
      def send_to_contact(params)
        parsed, options = SentDm::MessageSendToContactParams.dump_request(params)
        header_params = {x_api_key: "x-api-key", x_sender_id: "x-sender-id"}
        @client.request(
          method: :post,
          path: "v2/messages/contact",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
      # @overload send_to_phone(phone_number:, template_id:, x_api_key:, x_sender_id:, template_variables: nil, request_options: {})
      #
      # @param phone_number [String] Body param: The phone number to send the message to, in international format (e.
      #
      # @param template_id [String] Body param: The unique identifier of the template to use for the message
      #
      # @param x_api_key [String] Header param
      #
      # @param x_sender_id [String] Header param
      #
      # @param template_variables [Hash{Symbol=>String}, nil] Body param: Optional key-value pairs of template variables to replace in the tem
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::MessageSendToPhoneParams
      def send_to_phone(params)
        parsed, options = SentDm::MessageSendToPhoneParams.dump_request(params)
        header_params = {x_api_key: "x-api-key", x_sender_id: "x-sender-id"}
        @client.request(
          method: :post,
          path: "v2/messages/phone",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
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
