# frozen_string_literal: true

module Sentdm
  module Resources
    # Retrieve account details
    class Me
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::MeRetrieveParams} for more details.
      #
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
      #
      # @overload retrieve(x_profile_id: nil, request_options: {})
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::MeRetrieveResponse]
      #
      # @see Sentdm::Models::MeRetrieveParams
      def retrieve(params = {})
        parsed, options = Sentdm::MeRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/me",
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::MeRetrieveResponse,
          options: options
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
