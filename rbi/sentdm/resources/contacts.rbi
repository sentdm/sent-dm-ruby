# typed: strong

module Sentdm
  module Resources
    class Contacts
      # Creates a new contact by phone number and associates it with the authenticated
      # customer.
      sig do
        params(
          phone_number: String,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseContact)
      end
      def create(
        # Body param: Phone number of the contact to create
        phone_number: nil,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Retrieves a specific contact by their unique identifier. Returns detailed
      # contact information including phone formats, available channels, and opt-out
      # status.
      sig do
        params(
          id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseContact)
      end
      def retrieve(
        # Contact ID from route parameter
        id,
        request_options: {}
      )
      end

      # Updates a contact's default channel and/or opt-out status. Inherited contacts
      # cannot be updated.
      sig do
        params(
          id: String,
          default_channel: T.nilable(String),
          opt_out: T.nilable(T::Boolean),
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseContact)
      end
      def update(
        # Path param: Contact ID from route parameter
        id,
        # Body param: Default messaging channel: "sms" or "whatsapp"
        default_channel: nil,
        # Body param: Whether the contact has opted out of messaging
        opt_out: nil,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
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
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ContactListResponse)
      end
      def list(
        # Page number (1-indexed)
        page:,
        page_size:,
        # Optional channel filter (sms, whatsapp)
        channel: nil,
        # Optional phone number filter (alternative to list view)
        phone: nil,
        # Optional search term for filtering contacts
        search: nil,
        request_options: {}
      )
      end

      # Dissociates a contact from the authenticated customer. Inherited contacts cannot
      # be deleted.
      sig do
        params(
          id: String,
          body: Sentdm::ContactDeleteParams::Body::OrHash,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Contact ID from route parameter
        id,
        # Request to delete/dissociate a contact
        body:,
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
