# typed: strong

module SentDm
  module Resources
    class Me
      # Returns the account associated with the API key. For organization API keys,
      # returns the organization with its profiles. For profile API keys, returns the
      # profile with its settings.
      sig do
        params(request_options: SentDm::RequestOptions::OrHash).returns(
          SentDm::Models::MeRetrieveResponse
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
