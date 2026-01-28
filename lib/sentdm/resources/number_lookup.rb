# frozen_string_literal: true

module Sentdm
  module Resources
    class NumberLookup
      # Retrieves detailed information about a phone number including validation,
      # formatting, country information, and available messaging channels. The customer
      # ID is extracted from the authentication token.
      #
      # @overload retrieve(phone_number:, request_options: {})
      #
      # @param phone_number [String]
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::NumberLookupRetrieveResponse]
      #
      # @see Sentdm::Models::NumberLookupRetrieveParams
      def retrieve(params)
        parsed, options = Sentdm::NumberLookupRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v2/number-lookup",
          query: parsed.transform_keys(phone_number: "phoneNumber"),
          model: Sentdm::Models::NumberLookupRetrieveResponse,
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
