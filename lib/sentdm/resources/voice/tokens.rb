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
      class Tokens
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::TokenCreateParams} for more details.
        #
        # Mints a short-lived token for one of your app users. Call this from your backend
        # and return the token to your app, which passes it to the voice client SDK to
        # register. The identity is bound to the given number, or to your default app-call
        # number when omitted, and calls placed by that identity are routed through the
        # bound number. Minting again re-binds the identity, so an identity can move
        # between numbers.
        #
        # @overload create(identity: nil, number: nil, sandbox: nil, ttl: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param identity [String] Body param: Your identifier for the app user, such as an agent or account id. Le
        #
        # @param number [String, nil] Body param: One of your voice-enabled phone numbers in E.164 format. Calls place
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param ttl [Integer, nil] Body param: Token lifetime in seconds. Defaults to 600 and cannot exceed 3600.
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfVoiceToken]
        #
        # @see Sentdm::Models::Voice::TokenCreateParams
        def create(params = {})
          parsed, options = Sentdm::Voice::TokenCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/voice/tokens",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Voice::APIResponseOfVoiceToken,
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
