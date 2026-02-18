# typed: strong

module SentDm
  module Resources
    class Lookup
      # Validates a phone number and retrieves formatting, country, and timezone
      # information from the internal index. Provider-agnostic and works for all
      # customers.
      sig do
        params(
          phone_number: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::LookupRetrievePhoneInfoResponse)
      end
      def retrieve_phone_info(phone_number, request_options: {})
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
