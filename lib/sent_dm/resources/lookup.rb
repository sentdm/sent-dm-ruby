# frozen_string_literal: true

module SentDm
  module Resources
    class Lookup
      # Validates a phone number and retrieves formatting, country, and timezone
      # information from the internal index. Provider-agnostic and works for all
      # customers.
      #
      # @overload retrieve_phone_info(phone_number, request_options: {})
      #
      # @param phone_number [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::LookupRetrievePhoneInfoResponse]
      #
      # @see SentDm::Models::LookupRetrievePhoneInfoParams
      def retrieve_phone_info(phone_number, params = {})
        @client.request(
          method: :get,
          path: ["v3/lookup/number/%1$s", phone_number],
          model: SentDm::Models::LookupRetrievePhoneInfoResponse,
          options: params[:request_options]
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
