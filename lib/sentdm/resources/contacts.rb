# frozen_string_literal: true

module Sentdm
  module Resources
    class Contacts
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactCreateParams} for more details.
      #
      # Creates a new contact by phone number and associates it with the authenticated
      # customer.
      #
      # @overload create(phone_number: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param phone_number [String] Body param: Phone number of the contact to create
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseContact]
      #
      # @see Sentdm::Models::ContactCreateParams
      def create(params = {})
        parsed, options = Sentdm::ContactCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "v3/contacts",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseContact,
          options: options
        )
      end

      # Retrieves a specific contact by their unique identifier. Returns detailed
      # contact information including phone formats, available channels, and opt-out
      # status.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Contact ID from route parameter
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseContact]
      #
      # @see Sentdm::Models::ContactRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v3/contacts/%1$s", id],
          model: Sentdm::APIResponseContact,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ContactUpdateParams} for more details.
      #
      # Updates a contact's default channel and/or opt-out status. Inherited contacts
      # cannot be updated.
      #
      # @overload update(id, default_channel: nil, opt_out: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param id [String] Path param: Contact ID from route parameter
      #
      # @param default_channel [String, nil] Body param: Default messaging channel: "sms" or "whatsapp"
      #
      # @param opt_out [Boolean, nil] Body param: Whether the contact has opted out of messaging
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseContact]
      #
      # @see Sentdm::Models::ContactUpdateParams
      def update(id, params = {})
        parsed, options = Sentdm::ContactUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :patch,
          path: ["v3/contacts/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseContact,
          options: options
        )
      end

      # Retrieves a paginated list of contacts for the authenticated customer. Supports
      # filtering by search term, channel, or phone number.
      #
      # @overload list(page:, page_size:, channel: nil, phone: nil, search: nil, request_options: {})
      #
      # @param page [Integer] Page number (1-indexed)
      #
      # @param page_size [Integer]
      #
      # @param channel [String, nil] Optional channel filter (sms, whatsapp)
      #
      # @param phone [String, nil] Optional phone number filter (alternative to list view)
      #
      # @param search [String, nil] Optional search term for filtering contacts
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::ContactListResponse]
      #
      # @see Sentdm::Models::ContactListParams
      def list(params)
        parsed, options = Sentdm::ContactListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/contacts",
          query: parsed.transform_keys(page_size: "pageSize"),
          model: Sentdm::Models::ContactListResponse,
          options: options
        )
      end

      # Dissociates a contact from the authenticated customer. Inherited contacts cannot
      # be deleted.
      #
      # @overload delete(id, body:, request_options: {})
      #
      # @param id [String] Contact ID from route parameter
      #
      # @param body [Sentdm::Models::ContactDeleteParams::Body] Request to delete/dissociate a contact
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::ContactDeleteParams
      def delete(id, params)
        parsed, options = Sentdm::ContactDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/contacts/%1$s", id],
          headers: {"content-type" => "*/*"},
          body: parsed[:body],
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
