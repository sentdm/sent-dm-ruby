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
      class Agents
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::AgentCreateParams} for more details.
        #
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
        #
        # @overload create(audio: nil, fallback: nil, greeting: nil, limits: nil, name: nil, sandbox: nil, session_type: nil, speech: nil, tools: nil, transcripts: nil, transfer_targets: nil, websocket_url: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param audio [Sentdm::Models::Voice::VoiceAgentAudioSpec, nil] Body param: Audio sessions only: the sound format.
        #
        # @param fallback [Sentdm::Models::Voice::VoiceAgentPartySpec, nil] Body param: Who takes the call when the agent cannot: a phone number (kind: numb
        #
        # @param greeting [String, nil] Body param: Text sessions only: what the caller hears as soon as the call is ans
        #
        # @param limits [Sentdm::Models::Voice::VoiceAgentLimitsSpec, nil] Body param
        #
        # @param name [String, nil] Body param: A name for your own reference, 1 to 100 characters.
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param session_type [String, nil] Body param: text: Sent turns the caller's speech into text and the agent's text
        #
        # @param speech [Sentdm::Models::Voice::VoiceAgentSpeechSpec, nil] Body param: Text sessions only: how the caller is spoken to and listened to.
        #
        # @param tools [Array<String>, nil] Body param: What the agent may do to the call: any of transfer, hangup, send_dtm
        #
        # @param transcripts [Sentdm::Models::Voice::VoiceAgentTranscriptsSpec, nil] Body param
        #
        # @param transfer_targets [Array<Sentdm::Models::Voice::VoiceAgentPartySpec>, nil] Body param: Where the agent may transfer a call to, up to 20 parties: a phone nu
        #
        # @param websocket_url [String, nil] Body param: Where the gateway connects to the agent for each call: an absolute w
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfVoiceAgent]
        #
        # @see Sentdm::Models::Voice::AgentCreateParams
        def create(params = {})
          parsed, options = Sentdm::Voice::AgentCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/voice/agents",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Voice::APIResponseOfVoiceAgent,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::AgentRetrieveParams} for more details.
        #
        # The agent as stored, without its signing secret.
        #
        # @overload retrieve(id, x_profile_id: nil, request_options: {})
        #
        # @param id [String] The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfVoiceAgent]
        #
        # @see Sentdm::Models::Voice::AgentRetrieveParams
        def retrieve(id, params = {})
          parsed, options = Sentdm::Voice::AgentRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/voice/agents/%1$s", id],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Voice::APIResponseOfVoiceAgent,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::AgentUpdateParams} for more details.
        #
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
        #
        # @overload update(id, audio: nil, fallback: nil, greeting: nil, limits: nil, name: nil, sandbox: nil, session_type: nil, speech: nil, tools: nil, transcripts: nil, transfer_targets: nil, websocket_url: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
        #
        # @param audio [Sentdm::Models::Voice::VoiceAgentAudioSpec, nil] Body param: Audio sessions: { sample_rate }; null restores the default.
        #
        # @param fallback [Sentdm::Models::Voice::VoiceAgentPartySpec, nil] Body param: A new fallback party, or null for none.
        #
        # @param greeting [String, nil] Body param: A new greeting, or null for none.
        #
        # @param limits [Sentdm::Models::Voice::VoiceAgentLimitsSpec, nil] Body param: The whole limits object; null restores the defaults.
        #
        # @param name [String] Body param: A new name, 1 to 100 characters.
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param session_type [String] Body param: text or audio. Changing it drops the settings the other type cannot
        #
        # @param speech [Sentdm::Models::Voice::VoiceAgentSpeechSpec, nil] Body param: Text sessions: { setting, voice, language }, replaced whole; null re
        #
        # @param tools [Array<String>, nil] Body param: The whole list of tools; null restores the default.
        #
        # @param transcripts [Sentdm::Models::Voice::VoiceAgentTranscriptsSpec, nil] Body param: The whole transcripts object; null restores the defaults.
        #
        # @param transfer_targets [Array<Sentdm::Models::Voice::VoiceAgentPartySpec>, nil] Body param: The whole list of parties; null clears it.
        #
        # @param websocket_url [String, nil] Body param: A new wss:// URL, or null for an agent that dials in.
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfVoiceAgent]
        #
        # @see Sentdm::Models::Voice::AgentUpdateParams
        def update(id, params = {})
          parsed, options = Sentdm::Voice::AgentUpdateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :patch,
            path: ["v3/voice/agents/%1$s", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Voice::APIResponseOfVoiceAgent,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::AgentListParams} for more details.
        #
        # Your voice agents, newest first. `page` and `page_size` (1 to 100, default 20)
        # page the list. Signing secrets are never listed.
        #
        # @overload list(page: nil, page_size: nil, x_profile_id: nil, request_options: {})
        #
        # @param page [Integer] Query param: Page number, from 1
        #
        # @param page_size [Integer] Query param
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Internal::VoiceAgentsPage<Sentdm::Models::Voice::VoiceAgent>]
        #
        # @see Sentdm::Models::Voice::AgentListParams
        def list(params = {})
          query_params = [:page, :page_size]
          parsed, options = Sentdm::Voice::AgentListParams.dump_request(params)
          query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v3/voice/agents",
            query: query,
            headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
            page: Sentdm::Internal::VoiceAgentsPage,
            model: Sentdm::Voice::VoiceAgent,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::AgentDeleteParams} for more details.
        #
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
        #
        # @overload delete(id, sandbox: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Voice::AgentDeleteParams
        def delete(id, params = {})
          parsed, options = Sentdm::Voice::AgentDeleteParams.dump_request(params)
          header_params = {x_profile_id: "x-profile-id"}
          @client.request(
            method: :delete,
            path: ["v3/voice/agents/%1$s", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::AgentRotateSecretParams} for more details.
        #
        # Generates a new `signing_secret` for the agent and returns it. The previous
        # secret stops signing immediately, so update your agent before the next call
        # reaches it.
        #
        # With `sandbox: true` a secret is generated and returned with `202`, and nothing
        # is written.
        #
        # @overload rotate_secret(id, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The agent id, such as agent_9f2ab000-0000-4000-8000-000000000001
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfVoiceAgentSecret]
        #
        # @see Sentdm::Models::Voice::AgentRotateSecretParams
        def rotate_secret(id, params = {})
          parsed, options = Sentdm::Voice::AgentRotateSecretParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/voice/agents/%1$s/rotate-secret", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Voice::APIResponseOfVoiceAgentSecret,
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
