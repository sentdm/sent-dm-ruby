# typed: strong

module Sentdm
  module Resources
    # The people you message, and their channel identities.
    #
    # A contact holds one identity per channel — a phone number, a WhatsApp number —
    # so routing can choose between them for the same person. Opt-out is recorded
    # against the contact and honoured on every send, whichever channel it came
    # through.
    #
    # `GET /v3/contacts/{id}/message-summary` is the per-contact view of what you have
    # sent and what happened to it.
    class Contacts
      # Creates a new contact by phone number and associates it with the authenticated
      # customer.
      sig do
        params(
          phone_number: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ContactCreateResponse)
      end
      def create(
        # Body param: Phone number of the contact to create
        phone_number:,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
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

      # Retrieves a specific contact by their unique identifier. Returns detailed
      # contact information including phone formats, available channels, and opt-out
      # status.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ContactRetrieveResponse)
      end
      def retrieve(
        # Contact ID from route parameter
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Updates a contact's default channel and/or opt-out status.
      sig do
        params(
          id: String,
          default_channel: T.nilable(String),
          opt_out: T.nilable(T::Boolean),
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ContactUpdateResponse)
      end
      def update(
        # Path param: Contact ID from route parameter
        id,
        # Body param: Default messaging channel: "sms" or "whatsapp"
        default_channel: nil,
        # Body param: Whether the contact has opted out of messaging. Single source of
        # truth — opt-out is per-contact, not per-channel.
        opt_out: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
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

      # Retrieves a paginated list of contacts for the authenticated customer. Supports
      # filtering by search term, channel, or phone number.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          channel: T.nilable(String),
          phone: T.nilable(String),
          search: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ContactListResponse)
      end
      def list(
        # Query param: Page number (1-indexed)
        page:,
        # Query param: Number of items per page
        page_size:,
        # Query param: Optional channel filter (sms, whatsapp)
        channel: nil,
        # Query param: Optional phone number filter (alternative to list view)
        phone: nil,
        # Query param: Optional search term for filtering contacts
        search: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # **Deprecated.** Use `PATCH /v3/contacts/{id}` with `{"opt_out": true}` instead,
      # and expect this to be removed in a future release. It still behaves exactly as
      # before, so nothing needs to change today.
      #
      # Opting a contact out stops every send to them, which is what deleting one was
      # mostly used for — and it keeps the record of who they were and that they asked.
      # A delete discards the consent history along with the contact, which is the part
      # you need if anyone ever asks why you stopped, or why you started again.
      #
      # Dissociates a contact from the authenticated customer.
      sig do
        params(
          id: String,
          sandbox: T::Boolean,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Path param: Contact ID from route parameter
        id,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Returns aggregate message counts, time bounds, channels used, and per-channel
      # success/fail scores (each as a percentage 0-100 of messages on that channel) for
      # one of your contacts. Successful terminal states: SENT/DELIVERED/READ for
      # outbound, RECEIVED for inbound. Fail: FAILED.
      sig do
        params(
          contact_id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ContactRetrieveMessageSummaryResponse)
      end
      def retrieve_message_summary(
        contact_id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
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
