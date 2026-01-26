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
          x_api_key: String,
          x_sender_id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::NumberLookupRetrieveResponse)
      end
      def retrieve(
        # Query param
        phone_number:,
        # Header param
        x_api_key:,
        # Header param
        x_sender_id:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
