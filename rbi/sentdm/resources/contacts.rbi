# typed: strong

module Sentdm
  module Resources
    # Create, update, and manage customer contact lists
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
        ).returns(Sentdm::APIResponseOfContact)
      end
      def create(
        # Body param: Phone number of the contact to create
        phone_number: nil,
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
        ).returns(Sentdm::APIResponseOfContact)
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

      # Updates a contact's default channel and/or opt-out status. Inherited contacts
      # cannot be updated.
      sig do
        params(
          id: String,
          channel_consent: T.nilable(T::Hash[Symbol, String]),
          default_channel: T.nilable(String),
          opt_out: T.nilable(T::Boolean),
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfContact)
      end
      def update(
        # Path param: Contact ID from route parameter
        id,
        # Body param: Consent status by channel. Keys: "sms", "whatsapp". Values:
        # "opted_in", "opted_out". All entries must have the same status — mixed values
        # (e.g., sms: opted_out + whatsapp: opted_in) are rejected with 400. The provided
        # status is applied to ALL channels regardless of which keys are specified,
        # because consent is global across channels. When provided, takes precedence over
        # the opt_out field.
        channel_consent: nil,
        # Body param: Default messaging channel: "sms" or "whatsapp"
        default_channel: nil,
        # Body param: Whether the contact has opted out of messaging
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

      # Dissociates a contact from the authenticated customer. Inherited contacts cannot
      # be deleted.
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

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
