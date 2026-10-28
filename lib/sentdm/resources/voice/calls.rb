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
      class Calls
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
        # @return [Sentdm::Resources::Voice::Calls::Participants]
        attr_reader :participants

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::CallRetrieveParams} for more details.
        #
        # Retrieves one of your calls by id: the parties, the owning number, the phone
        # number the call was connected to and the caller id it showed, the current status
        # with its failure reason, duration, price with the billed legs and what each
        # cost, recording availability, and a timeline of when the call entered each
        # status.
        #
        # @overload retrieve(id, x_profile_id: nil, request_options: {})
        #
        # @param id [String] The call id from the route, as carried by call webhooks and the calls list, for
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfCall]
        #
        # @see Sentdm::Models::Voice::CallRetrieveParams
        def retrieve(id, params = {})
          parsed, options = Sentdm::Voice::CallRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/voice/calls/%1$s", id],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Voice::APIResponseOfCall,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::CallListParams} for more details.
        #
        # Retrieves a paginated list of your calls, most recent first. Filter by
        # direction, status, the owning number, the mode (inapp, or agent for calls your
        # voice agents answered), the agent that answered, and the time the call started
        # (from and to are inclusive). Each call carries the phone number it was connected
        # to, the caller id it showed, and the billed legs with what each cost. Use the
        # call webhooks for real-time updates; this list is for looking calls up
        # afterwards.
        #
        # @overload list(agent_id: nil, direction: nil, from: nil, mode: nil, number: nil, page: nil, page_size: nil, status: nil, to: nil, x_profile_id: nil, request_options: {})
        #
        # @param agent_id [String, nil] Query param: Optional filter on the voice agent that answered the call, such as
        #
        # @param direction [String, nil] Query param: Optional direction filter: outbound for calls placed from your app,
        #
        # @param from [Time, nil] Query param: Only calls started at or after this time (ISO 8601)
        #
        # @param mode [String, nil] Query param: Optional mode filter: inapp for calls routed by your number's callb
        #
        # @param number [String, nil] Query param: Optional filter on the number that owns the call, one of your voice
        #
        # @param page [Integer] Query param: Page number (1-indexed)
        #
        # @param page_size [Integer] Query param: Number of items per page
        #
        # @param status [String, nil] Query param: Optional status filter: initiated, ringing, answered, completed, fa
        #
        # @param to [Time, nil] Query param: Only calls started at or before this time (ISO 8601)
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Internal::CallsPage<Sentdm::Models::Voice::Call>]
        #
        # @see Sentdm::Models::Voice::CallListParams
        def list(params = {})
          query_params = [:agent_id, :direction, :from, :mode, :number, :page, :page_size, :status, :to]
          parsed, options = Sentdm::Voice::CallListParams.dump_request(params)
          query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v3/voice/calls",
            query: query,
            headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
            page: Sentdm::Internal::CallsPage,
            model: Sentdm::Voice::Call,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::CallHangupParams} for more details.
        #
        # Ends one of your live calls. The call then ends the way any other call does once
        # the disconnect is reported: an answered call as COMPLETED with call.completed, a
        # call still ringing as NO_ANSWER, REJECTED or FAILED with call.failed. A call
        # that has already ended answers 409, as do a call with no phone leg, such as one
        # between two app users, and a call one of your voice agents answers.
        #
        # @overload hangup(id, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The call id from the route, as carried by call webhooks and the call
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Voice::CallHangupParams
        def hangup(id, params = {})
          parsed, options = Sentdm::Voice::CallHangupParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/voice/calls/%1$s/hangup", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::CallListRecordingsParams} for more details.
        #
        # Returns pre-signed links to the recordings of one of your calls, each valid
        # until its url_expires_at. A recording appears once the call was recorded, by a
        # connect answer with record set, a startRecording instruction or the recordings
        # command, and the call.recording_ready webhook has been sent; until then, and for
        # a call that was never recorded, the list is empty. A call recorded more than
        # once lists every recording, oldest first, each under the recording_id its
        # call.recording_ready webhook carried.
        #
        # @overload list_recordings(id, x_profile_id: nil, request_options: {})
        #
        # @param id [String] The call id from the route, as carried by call webhooks and the calls list, for
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Voice::APIResponseOfCallRecordings]
        #
        # @see Sentdm::Models::Voice::CallListRecordingsParams
        def list_recordings(id, params = {})
          parsed, options = Sentdm::Voice::CallListRecordingsParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/voice/calls/%1$s/recordings", id],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Voice::APIResponseOfCallRecordings,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Voice::CallRecordParams} for more details.
        #
        # Starts or stops recording one of your live calls. Use start to begin recording
        # mid-call, or stop to end a recording, whether it was started here or by a
        # connect answer with record set. A call that has already ended answers 409, as do
        # a call with no phone leg, such as one between two app users, and a call one of
        # your voice agents answers, neither of which can be recorded this way.
        #
        # @overload record(id, action: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The call id from the route, as carried by call webhooks and the call
        #
        # @param action [String] Body param: start to begin recording, stop to end it
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Voice::CallRecordParams
        def record(id, params = {})
          parsed, options = Sentdm::Voice::CallRecordParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/voice/calls/%1$s/recordings", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: NilClass,
            options: options
          )
        end

        # @api private
        #
        # @param client [Sentdm::Client]
        def initialize(client:)
          @client = client
          @participants = Sentdm::Resources::Voice::Calls::Participants.new(client: client)
        end
      end
    end
  end
end
