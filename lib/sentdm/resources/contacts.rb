# frozen_string_literal: true

module Sentdm
  module Resources
    # Create, update, and manage customer contact lists
    class Contacts
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactCreateParams} for more details.
      #
      # Creates a new contact by phone number and associates it with the authenticated
      # customer.
      #
      # @overload create(phone_number: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param phone_number [String] Body param: Phone number of the contact to create
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfContact]
      #
      # @see Sentdm::Models::ContactCreateParams
      def create(params = {})
        parsed, options = Sentdm::ContactCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: "v3/contacts",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseOfContact,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactRetrieveParams} for more details.
      #
      # Retrieves a specific contact by their unique identifier. Returns detailed
      # contact information including phone formats, available channels, and opt-out
      # status.
      #
      # @overload retrieve(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Contact ID from route parameter
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfContact]
      #
      # @see Sentdm::Models::ContactRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Sentdm::ContactRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/contacts/%1$s", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfContact,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactUpdateParams} for more details.
      #
      # Updates a contact's default channel and/or opt-out status. Inherited contacts
      # cannot be updated.
      #
      # @overload update(id, channel_consent: nil, default_channel: nil, opt_out: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param: Contact ID from route parameter
      #
      # @param channel_consent [Hash{Symbol=>String}, nil] Body param: Consent status by channel. Keys: "sms", "whatsapp". Values: "opted_i
      #
      # @param default_channel [String, nil] Body param: Default messaging channel: "sms" or "whatsapp"
      #
      # @param opt_out [Boolean, nil] Body param: Whether the contact has opted out of messaging
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfContact]
      #
      # @see Sentdm::Models::ContactUpdateParams
      def update(id, params = {})
        parsed, options = Sentdm::ContactUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :patch,
          path: ["v3/contacts/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseOfContact,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactListParams} for more details.
      #
      # Retrieves a paginated list of contacts for the authenticated customer. Supports
      # filtering by search term, channel, or phone number.
      #
      # @overload list(page:, page_size:, channel: nil, phone: nil, search: nil, x_profile_id: nil, request_options: {})
      #
      # @param page [Integer] Query param: Page number (1-indexed)
      #
      # @param page_size [Integer] Query param: Number of items per page
      #
      # @param channel [String, nil] Query param: Optional channel filter (sms, whatsapp)
      #
      # @param phone [String, nil] Query param: Optional phone number filter (alternative to list view)
      #
      # @param search [String, nil] Query param: Optional search term for filtering contacts
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::ContactListResponse]
      #
      # @see Sentdm::Models::ContactListParams
      def list(params)
        query_params = [:page, :page_size, :channel, :phone, :search]
        parsed, options = Sentdm::ContactListParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v3/contacts",
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::ContactListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactDeleteParams} for more details.
      #
      # Dissociates a contact from the authenticated customer. Inherited contacts cannot
      # be deleted.
      #
      # @overload delete(id, sandbox: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param: Contact ID from route parameter
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::ContactDeleteParams
      def delete(id, params = {})
        parsed, options = Sentdm::ContactDeleteParams.dump_request(params)
        header_params = {x_profile_id: "x-profile-id"}
        @client.request(
          method: :delete,
          path: ["v3/contacts/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
