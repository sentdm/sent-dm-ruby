# frozen_string_literal: true

module Sentdm
  module Resources
    class Voice
      # Phone calls from the numbers you hold, driven by your own callback URL.
      #
      # `POST /v3/channels/voice` enables a number for calls, with the callback URL Sent
      # asks what to do with each call on it, and `POST /v3/voice/tokens` mints a
      # short-lived token that lets a user of your app place and receive calls as that
      # number. When a call arrives or a caller presses a key, a signed question is
      # POSTed to the callback URL and the answer decides the call;
      # `POST /v3/channels/voice/{number}/test` checks the URL answers the way we need
      # before a real call reaches it, and
      # `POST /v3/channels/voice/{number}/rotate-secret` replaces the signing secret.
      # The call events themselves (`call.completed` and the rest) arrive through your
      # webhooks.
      #
      # Every call is a record under `/v3/voice/calls`: read it, list its recordings
      # once one is ready, hang it up, start or stop recording, and add, mute or remove
      # conference participants while it is live. A leg to a phone number runs for at
      # most what your balance affords at the destination's rate.
      #
      # **Voice agents.** `POST /v3/voice/agents` creates an agent that answers calls
      # through the Sent Voice Gateway: `session_type` says whether Sent carries the
      # call as text (speech recognised and spoken for the agent) or as audio,
      # `websocket_url` is where the gateway dials the agent for each call (leave it out
      # and the agent dials in with your API key), and `tools`, `transfer_targets`,
      # `fallback` and `limits` say what it may do on a call. The agent's
      # `signing_secret` is shown on create and on
      # `POST /v3/voice/agents/{id}/rotate-secret` only. Voices and languages for text
      # sessions come from `GET /v3/voice/voices`. A number takes calls to an agent once
      # it is bound to it on `/v3/channels/voice`.
      class Voices
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::VoiceListParams} for more details.
        #
        # The names a voice agent's `speech.voice` and `speech.language` accept, with the
        # default marked. The list grows as voices are added; a name is never removed
        # without notice.
        #
        # @overload list(x_profile_id: nil, request_options: {})
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfVoiceCatalogue]
        #
        # @see Sentdm::Models::Voice::VoiceListParams
        def list(params = {})
          parsed, options = Sentdm::Voice::VoiceListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v3/voice/voices",
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Voice::APIResponseOfVoiceCatalogue,
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
end
