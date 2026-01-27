# frozen_string_literal: true

module SentDm
  module Resources
    class NumberLookup
      # Retrieves detailed information about a phone number including validation,
      # formatting, country information, and available messaging channels. The customer
      # ID is extracted from the authentication token.
      #
      # @overload retrieve(phone_number:, request_options: {})
      #
      # @param phone_number [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::NumberLookupRetrieveResponse]
      #
      # @see SentDm::Models::NumberLookupRetrieveParams
      def retrieve(params)
        parsed, options = SentDm::NumberLookupRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v2/number-lookup",
          query: parsed.transform_keys(phone_number: "phoneNumber"),
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
