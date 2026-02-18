# typed: strong

module Sentdm
  module Resources
    class Me
      # Returns the account associated with the API key. For organization API keys,
      # returns the organization with its profiles. For profile API keys, returns the
      # profile with its settings.
      sig do
        params(request_options: Sentdm::RequestOptions::OrHash).returns(
          Sentdm::Models::MeRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
