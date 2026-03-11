# typed: strong

module Sentdm
  module Resources
    # Manage and lookup phone numbers
    class Numbers
      # Retrieves detailed information about a phone number including carrier, line
      # type, porting status, and VoIP detection. Uses the customer's messaging provider
      # for rich data, with fallback to the internal index.
      sig do
        params(
          phone_number: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::NumberLookupResponse)
      end
      def lookup(
        phone_number,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
