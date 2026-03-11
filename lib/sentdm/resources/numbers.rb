# frozen_string_literal: true

module Sentdm
  module Resources
    # Manage and lookup phone numbers
    class Numbers
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::NumberLookupParams} for more details.
      #
      # Retrieves detailed information about a phone number including carrier, line
      # type, porting status, and VoIP detection. Uses the customer's messaging provider
      # for rich data, with fallback to the internal index.
      #
      # @overload lookup(phone_number, x_profile_id: nil, request_options: {})
      #
      # @param phone_number [String]
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::NumberLookupResponse]
      #
      # @see Sentdm::Models::NumberLookupParams
      def lookup(phone_number, params = {})
        parsed, options = Sentdm::NumberLookupParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/numbers/lookup/%1$s", phone_number],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::NumberLookupResponse,
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
