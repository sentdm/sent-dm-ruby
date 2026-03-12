# typed: strong

module Sentdm
  module Resources
    # Send and track SMS and WhatsApp messages
    class Messages
      # Retrieves the activity log for a specific message. Activities track the message
      # lifecycle including acceptance, processing, sending, delivery, and any errors.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::MessageRetrieveActivitiesResponse)
      end
      def retrieve_activities(
        # Message ID from route parameter
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves the current status and details of a message by ID. Includes delivery
      # status, timestamps, and error information if applicable.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::MessageRetrieveStatusResponse)
      end
      def retrieve_status(
        # Message ID
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Sends a message to one or more recipients using a template. Supports
      # multi-channel broadcast — when multiple channels are specified (e.g. ["sms",
      # "whatsapp"]), a separate message is created for each (recipient, channel) pair.
      # Returns immediately with per-recipient message IDs for async tracking via
      # webhooks or the GET /messages/{id} endpoint.
      sig do
        params(
          channel: T.nilable(T::Array[String]),
          sandbox: T::Boolean,
          template: Sentdm::MessageSendParams::Template::OrHash,
          to: T::Array[String],
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::MessageSendResponse)
      end
      def send_(
        # Body param: Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel
        # produces a separate message per recipient. "sent" = auto-detect, "rcs" =
        # reserved (skipped). Defaults to ["sent"] (auto-detect) if omitted.
        channel: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: SDK-style template reference: resolve by ID or by name, with
        # optional parameters.
        template: nil,
        # Body param: List of recipient phone numbers in E.164 format (multi-recipient
        # fan-out)
        to: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
