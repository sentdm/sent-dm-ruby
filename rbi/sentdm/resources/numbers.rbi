# typed: strong

module Sentdm
  module Resources
    # What a phone number actually is, before you send to it.
    #
    # A lookup returns the number's country, line type and carrier, which is what
    # decides whether it is reachable on a channel and what it costs. Worth doing on
    # import rather than on send: a landline in a contact list is a message that can
    # never be delivered.
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
