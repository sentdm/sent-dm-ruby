# typed: strong

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
      class Agents
        # Creates an agent that answers phone calls through the Sent Voice Gateway.
        # `session_type` says whether Sent carries the call as text (the caller's speech
        # recognised for the agent, the agent's text spoken) or as audio. With
        # `websocket_url` the gateway dials your agent for each call and signs the
        # handshake with the `signing_secret` this response returns; without it, your
        # agent dials in with your API key and this agent's `id`.
        #
        # `tools`, `transfer_targets`, `fallback` and `limits` say what the agent may do
        # on a call. Voices and languages for text sessions come from
        # `GET /v3/voice/voices`. Calls reach the agent once a number is bound to it on
        # `/v3/channels/voice`.
        #
        # `signing_secret` is shown here and on `POST /v3/voice/agents/{id}/rotate-secret`
        # only; store it now. With `sandbox: true` the request is validated and the agent
        # reported with `202`; nothing is written.
        sig do
          params(
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec::OrHash),
            fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec::OrHash),
            greeting: T.nilable(String),
            limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec::OrHash),
            name: T.nilable(String),
            sandbox: T::Boolean,
            session_type: T.nilable(String),
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec::OrHash),
            tools: T.nilable(T::Array[String]),
            transcripts:
              T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec::OrHash),
            transfer_targets:
              T.nilable(T::Array[Sentdm::Voice::VoiceAgentPartySpec::OrHash]),
            websocket_url: T.nilable(String),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Voice::APIResponseOfVoiceAgent)
        end
        def create(
          # Body param: Audio sessions only: the sound format.
          audio: nil,
          # Body param: Who takes the call when the agent cannot: a phone number (kind:
          # number). Omit it and such a call hangs up.
          fallback: nil,
          # Body param: Text sessions only: what the caller hears as soon as the call is
          # answered, before the agent's first turn. 1 to 4,096 characters. Omit it and the
          # agent speaks first.
          greeting: nil,
          # Body param
          limits: nil,
          # Body param: A name for your own reference, 1 to 100 characters.
          name: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Body param: text: Sent turns the caller's speech into text and the agent's text
          # into speech, so the agent exchanges text frames. audio: the agent receives and
          # sends the sound itself.
          session_type: nil,
          # Body param: Text sessions only: how the caller is spoken to and listened to.
          speech: nil,
          # Body param: What the agent may do to the call: any of transfer, hangup,
          # send_dtmf and hold. Default ["hangup"]. transfer needs at least one
          # transfer_targets entry.
          tools: nil,
          # Body param
          transcripts: nil,
          # Body param: Where the agent may transfer a call to, up to 20 parties: a phone
          # number (kind: number, E.164), one of your app users (kind: user, the identity)
          # or another of your agents (kind: agent, its id). The agent can only transfer to
          # a party listed here.
          transfer_targets: nil,
          # Body param: Where the gateway connects to the agent for each call: an absolute
          # wss:// URL on a public host, at most 2,048 characters. The handshake is signed
          # with the agent's signing_secret. Leave it out and the agent dials in instead,
          # connecting to the gateway with your API key.
          websocket_url: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # The agent as stored, without its signing secret.
        sig do
          params(
            id: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Voice::APIResponseOfVoiceAgent)
        end
        def retrieve(
          # The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
          id,
          # Profile UUID to scope the request to a child profile. Only organization API keys
          # can use this header. The profile must belong to the calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Changes the fields you name and answers with the agent as stored, the same shape
        # `GET` returns.
        #
        # A key left out is left alone. A key sent as `null` clears an optional field
        # (`websocket_url` makes the agent dial in, `greeting` and `fallback` go,
        # `speech`, `audio`, `tools`, `limits` and `transcripts` return to their
        # defaults). A key sent with a value replaces that field whole: send the whole
        # `limits` object, not one of its keys. Changing `session_type` drops `speech`,
        # `audio` and `greeting` unless the body sends them, since the other type cannot
        # carry them. The result is checked like a new agent, and a body that changes
        # nothing is `400`.
        #
        # With `sandbox: true` nothing is written: the request is validated against the
        # stored agent and the agent is reported with `200` as it would read after the
        # change.
        sig do
          params(
            id: String,
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec::OrHash),
            fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec::OrHash),
            greeting: T.nilable(String),
            limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec::OrHash),
            name: String,
            sandbox: T::Boolean,
            session_type: String,
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec::OrHash),
            tools: T.nilable(T::Array[String]),
            transcripts:
              T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec::OrHash),
            transfer_targets:
              T.nilable(T::Array[Sentdm::Voice::VoiceAgentPartySpec::OrHash]),
            websocket_url: T.nilable(String),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Voice::APIResponseOfVoiceAgent)
        end
        def update(
          # Path param: The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
          id,
          # Body param: Audio sessions: { sample_rate }; null restores the default.
          audio: nil,
          # Body param: A new fallback party, or null for none.
          fallback: nil,
          # Body param: A new greeting, or null for none.
          greeting: nil,
          # Body param: The whole limits object; null restores the defaults.
          limits: nil,
          # Body param: A new name, 1 to 100 characters.
          name: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Body param: text or audio. Changing it drops the settings the other type cannot
          # have (speech, audio, greeting) unless the body sends them.
          session_type: nil,
          # Body param: Text sessions: { setting, voice, language }, replaced whole; null
          # restores the defaults.
          speech: nil,
          # Body param: The whole list of tools; null restores the default.
          tools: nil,
          # Body param: The whole transcripts object; null restores the defaults.
          transcripts: nil,
          # Body param: The whole list of parties; null clears it.
          transfer_targets: nil,
          # Body param: A new wss:// URL, or null for an agent that dials in.
          websocket_url: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Your voice agents, newest first. `page` and `page_size` (1 to 100, default 20)
        # page the list. Signing secrets are never listed.
        sig do
          params(
            page: Integer,
            page_size: Integer,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(
            Sentdm::Internal::VoiceAgentsPage[Sentdm::Voice::VoiceAgent]
          )
        end
        def list(
          # Query param: Page number, from 1
          page: nil,
          # Query param
          page_size: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Removes the agent. Calls it already took keep their `agent_id`.
        #
        # An agent that one of your voice numbers routes to, or that another of your
        # agents lists in `transfer_targets`, is not deleted: the answer is `409` with a
        # message naming those numbers and agents. Unbind the numbers
        # (`PATCH /v3/channels/voice/{number}` with `"agent_id": null`), take the agent
        # out of the others' `transfer_targets` or delete them, and try again.
        #
        # With `sandbox: true` nothing is written: the agent is looked up and the answer
        # is the one a real delete would give.
        sig do
          params(
            id: String,
            sandbox: T::Boolean,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Path param: The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
          id,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Generates a new `signing_secret` for the agent and returns it. The previous
        # secret stops signing immediately, so update your agent before the next call
        # reaches it.
        #
        # With `sandbox: true` a secret is generated and returned with `202`, and nothing
        # is written.
        sig do
          params(
            id: String,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Voice::APIResponseOfVoiceAgentSecret)
        end
        def rotate_secret(
          # Path param: The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
          id,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
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
end
