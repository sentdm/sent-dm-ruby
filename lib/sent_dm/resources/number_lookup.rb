# frozen_string_literal: true

module SentDm
  module Resources
    class NumberLookup
      # Retrieves detailed information about a phone number including validation,
      # formatting, country information, and available messaging channels. The customer
      # ID is extracted from the authentication token.
      #
      # @overload retrieve(phone_number:, x_api_key:, x_sender_id:, request_options: {})
      #
      # @param phone_number [String] Query param
      #
      # @param x_api_key [String] Header param
      #
      # @param x_sender_id [String] Header param
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::NumberLookupRetrieveResponse]
      #
      # @see SentDm::Models::NumberLookupRetrieveParams
      def retrieve(params)
        parsed, options = SentDm::NumberLookupRetrieveParams.dump_request(params)
        query_params = [:phone_number]
        @client.request(
          method: :get,
          path: "v2/number-lookup",
          query: parsed.slice(*query_params).transform_keys(phone_number: "phoneNumber"),
          headers: parsed.except(*query_params).transform_keys(
            x_api_key: "x-api-key",
            x_sender_id: "x-sender-id"
          ),
          model: SentDm::Models::NumberLookupRetrieveResponse,
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
