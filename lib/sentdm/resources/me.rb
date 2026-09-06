# frozen_string_literal: true

module Sentdm
  module Resources
    # Who the current key is.
    #
    # `GET /v3/me` answers with the account the key authenticates as, which is the
    # quickest way to tell a live key from a test one, an organization key from a
    # sender profile's, and to confirm `x-profile-id` resolved to the profile you
    # meant.
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
      # **Sending number:** `sending_phone_number` is the account's US SMS sender. It is
      # intentionally the same value as `channels.sms.phone_number` — the two are kept
      # in step, and it is published under both names because `sending_phone_number` is
      # what this value is called on `GET /v3/profiles`. Read either. One difference:
      # `sending_phone_number` is always present, including as `null`, while
      # `channels.sms.phone_number` is omitted when there is no sender.
      #
      # `sending_phone_number_profile_id` names the account that holds that number in
      # inventory — normally this account, and a different one where a number is shared.
      # Both are `null` when the account has no US SMS sender.
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
