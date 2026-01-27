# typed: strong

module SentDm
  module Resources
    class Contacts
      # Retrieves a paginated list of contacts for the authenticated customer. Supports
      # server-side pagination with configurable page size. The customer ID is extracted
      # from the authentication token.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::ContactListResponse)
      end
      def list(
        # The page number (zero-indexed). Default is 0.
        page:,
        # The number of items per page. Default is 20.
        page_size:,
        request_options: {}
      )
      end

      # Retrieves a contact by their phone number for the authenticated customer. Phone
      # number should be in international format (e.g., +1234567890). The customer ID is
      # extracted from the authentication token.
      sig do
        params(
          phone_number: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::ContactListItem)
      end
      def retrieve_by_phone(
        # The phone number in international format (e.g., +1234567890)
        phone_number:,
        request_options: {}
      )
      end

      # Retrieves a specific contact by their unique identifier for the authenticated
      # customer. The customer ID is extracted from the authentication token. Returns
      # detailed contact information including phone number and creation timestamp.
      sig do
        params(
          id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::ContactListItem)
      end
      def retrieve_id(
        # The unique identifier (GUID) of the resource to retrieve
        id:,
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
