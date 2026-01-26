# typed: strong

module SentDm
  module Resources
    class Messages
      # Retrieves comprehensive details about a specific message using the message ID.
      # Returns complete message data including delivery status, channel information,
      # template details, contact information, and pricing. The customer ID is extracted
      # from the authentication token to ensure the message belongs to the authenticated
      # customer.
      sig do
        params(
          id: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::MessageRetrieveResponse)
      end
      def retrieve(id, x_api_key:, x_sender_id:, request_options: {})
      end

      # Sends a message to a phone number using the default template. This endpoint is
      # rate limited to 5 messages per customer per day. The customer ID is extracted
      # from the authentication token.
      sig do
        params(
          custom_message: String,
          phone_number: String,
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).void
      end
      def send_quick_message(
        # Body param: The custom message content to include in the template
        custom_message:,
        # Body param: The phone number to send the message to, in international format
        # (e.g., +1234567890)
        phone_number:,
        # Header param
        x_api_key:,
        # Header param
        x_sender_id:,
        request_options: {}
      )
      end

      # Sends a message to a specific contact using a template. The message can be sent
      # via SMS or WhatsApp depending on the contact's capabilities. Optionally specify
      # a webhook URL to receive delivery status updates. The customer ID is extracted
      # from the authentication token.
      sig do
        params(
          contact_id: String,
          template_id: String,
          x_api_key: String,
          x_sender_id: String,
          template_variables: T.nilable(T::Hash[Symbol, String]),
          request_options: SentDm::RequestOptions::OrHash
        ).void
      end
      def send_to_contact(
        # Body param: The unique identifier of the contact to send the message to
        contact_id:,
        # Body param: The unique identifier of the template to use for the message
        template_id:,
        # Header param
        x_api_key:,
        # Header param
        x_sender_id:,
        # Body param: Optional key-value pairs of template variables to replace in the
        # template body. For example, if your template contains "Hello {{name}}", you
        # would provide { "name": "John Doe" }
        template_variables: nil,
        request_options: {}
      )
      end

      # Sends a message to a phone number using a template. The phone number doesn't
      # need to be a pre-existing contact. The message can be sent via SMS or WhatsApp.
      # Optionally specify a webhook URL to receive delivery status updates. The
      # customer ID is extracted from the authentication token.
      sig do
        params(
          phone_number: String,
          template_id: String,
          x_api_key: String,
          x_sender_id: String,
          template_variables: T.nilable(T::Hash[Symbol, String]),
          request_options: SentDm::RequestOptions::OrHash
        ).void
      end
      def send_to_phone(
        # Body param: The phone number to send the message to, in international format
        # (e.g., +1234567890)
        phone_number:,
        # Body param: The unique identifier of the template to use for the message
        template_id:,
        # Header param
        x_api_key:,
        # Header param
        x_sender_id:,
        # Body param: Optional key-value pairs of template variables to replace in the
        # template body. For example, if your template contains "Hello {{name}}", you
        # would provide { "name": "John Doe" }
        template_variables: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
