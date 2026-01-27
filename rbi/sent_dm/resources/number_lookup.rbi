# typed: strong

module SentDm
  module Resources
    class NumberLookup
      # Retrieves detailed information about a phone number including validation,
      # formatting, country information, and available messaging channels. The customer
      # ID is extracted from the authentication token.
      sig do
        params(
          phone_number: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::NumberLookupRetrieveResponse)
      end
      def retrieve(phone_number:, request_options: {})
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
