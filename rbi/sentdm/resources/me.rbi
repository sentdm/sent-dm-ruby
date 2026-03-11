# typed: strong

module Sentdm
  module Resources
    # Retrieve account details
    class Me
      # Returns the account associated with the provided API key. The response includes
      # account identity, contact information, messaging channel configuration, and —
      # depending on the account type — either a list of child profiles or the profile's
      # own settings.
      #
      # **Account types:**
      #
      # - `organization` — Has child profiles. The `profiles` array is populated.
      # - `user` — Standalone account with no profiles.
      # - `profile` — Child of an organization. Includes `organization_id`,
      #   `short_name`, `status`, and `settings`.
      #
      # **Channels:** The `channels` object always includes `sms`, `whatsapp`, and
      # `rcs`. Each channel has a `configured` boolean. Configured channels expose
      # additional details such as `phone_number`.
      sig do
        params(
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::MeRetrieveResponse)
      end
      def retrieve(
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
