# frozen_string_literal: true

module Sentdm
  module Resources
    class Me
      # Returns the account associated with the API key. For organization API keys,
      # returns the organization with its profiles. For profile API keys, returns the
      # profile with its settings.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::MeRetrieveResponse]
      #
      # @see Sentdm::Models::MeRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v3/me",
          model: Sentdm::Models::MeRetrieveResponse,
          options: params[:request_options]
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
