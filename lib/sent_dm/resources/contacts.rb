# frozen_string_literal: true

module SentDm
  module Resources
    class Contacts
      # Retrieves a paginated list of contacts for the authenticated customer. Supports
      # server-side pagination with configurable page size. The customer ID is extracted
      # from the authentication token.
      #
      # @overload list(page:, page_size:, request_options: {})
      #
      # @param page [Integer] The page number (zero-indexed). Default is 0.
      #
      # @param page_size [Integer] The number of items per page. Default is 20.
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::ContactListResponse]
      #
      # @see SentDm::Models::ContactListParams
      def list(params)
        parsed, options = SentDm::ContactListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v2/contacts",
          query: parsed.transform_keys(page_size: "pageSize"),
          model: SentDm::Models::ContactListResponse,
          options: options
        )
      end

      # Retrieves a contact by their phone number for the authenticated customer. Phone
      # number should be in international format (e.g., +1234567890). The customer ID is
      # extracted from the authentication token.
      #
      # @overload retrieve_by_phone(phone_number:, request_options: {})
      #
      # @param phone_number [String] The phone number in international format (e.g., +1234567890)
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::ContactListItem]
      #
      # @see SentDm::Models::ContactRetrieveByPhoneParams
      def retrieve_by_phone(params)
        parsed, options = SentDm::ContactRetrieveByPhoneParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v2/contacts/phone",
          query: parsed.transform_keys(phone_number: "phoneNumber"),
          model: SentDm::ContactListItem,
          options: options
        )
      end

      # Retrieves a specific contact by their unique identifier for the authenticated
      # customer. The customer ID is extracted from the authentication token. Returns
      # detailed contact information including phone number and creation timestamp.
      #
      # @overload retrieve_id(id:, request_options: {})
      #
      # @param id [String] The unique identifier (GUID) of the resource to retrieve
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::ContactListItem]
      #
      # @see SentDm::Models::ContactRetrieveIDParams
      def retrieve_id(params)
        parsed, options = SentDm::ContactRetrieveIDParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v2/contacts/id",
          query: parsed,
          model: SentDm::ContactListItem,
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
