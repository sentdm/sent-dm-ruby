# frozen_string_literal: true

module Sentdm
  module Resources
    # Phone calls from the numbers you hold, driven by your own callback URL.
    #
    # `POST /v3/channels/voice` enables a number for calls, with the callback URL Sent
    # asks what to do with each call on it, and `POST /v3/channels/voice/tokens` mints
    # a short-lived token that lets a user of your app place and receive calls as that
    # number. When a call arrives or a caller presses a key, a signed question is
    # POSTed to the callback URL and the answer decides the call;
    # `POST /v3/channels/voice/{number}/test` checks the URL answers the way we need
    # before a real call reaches it, and
    # `POST /v3/channels/voice/{number}/rotate-secret` replaces the signing secret.
    # The call events themselves (`call.completed` and the rest) arrive through your
    # webhooks.
    #
    # Every call is a record under `/v3/calls`: read it, list its recordings once one
    # is ready, hang it up, start or stop recording, and add, mute or remove
    # conference participants while it is live. A leg to a phone number runs for at
    # most what your balance affords at the destination's rate.
    class Calls
      # Phone calls from the numbers you hold, driven by your own callback URL.
      #
      # `POST /v3/channels/voice` enables a number for calls, with the callback URL Sent
      # asks what to do with each call on it, and `POST /v3/channels/voice/tokens` mints
      # a short-lived token that lets a user of your app place and receive calls as that
      # number. When a call arrives or a caller presses a key, a signed question is
      # POSTed to the callback URL and the answer decides the call;
      # `POST /v3/channels/voice/{number}/test` checks the URL answers the way we need
      # before a real call reaches it, and
      # `POST /v3/channels/voice/{number}/rotate-secret` replaces the signing secret.
      # The call events themselves (`call.completed` and the rest) arrive through your
      # webhooks.
      #
      # Every call is a record under `/v3/calls`: read it, list its recordings once one
      # is ready, hang it up, start or stop recording, and add, mute or remove
      # conference participants while it is live. A leg to a phone number runs for at
      # most what your balance affords at the destination's rate.
      # @return [Sentdm::Resources::Calls::Participants]
      attr_reader :participants

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::CallRetrieveParams} for more details.
      #
      # Retrieves one of your calls by id: the parties, the owning number, the current
      # status with its failure reason, duration, price, recording availability, and a
      # timeline of when the call entered each status.
      #
      # @overload retrieve(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String] The call id from the route, as carried by call webhooks and the calls list, for
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfCall]
      #
      # @see Sentdm::Models::CallRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Sentdm::CallRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/calls/%1$s", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfCall,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::CallListParams} for more details.
      #
      # Retrieves a paginated list of your calls, most recent first. Filter by
      # direction, status, the owning number, and the time the call started (from and to
      # are inclusive). Use the call webhooks for real-time updates; this list is for
      # looking calls up afterwards.
      #
      # @overload list(direction: nil, from: nil, number: nil, page: nil, page_size: nil, status: nil, to: nil, x_profile_id: nil, request_options: {})
      #
      # @param direction [String, nil] Query param: Optional direction filter: outbound for calls placed from your app,
      #
      # @param from [Time, nil] Query param: Only calls started at or after this time (ISO 8601)
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
      # @return [Sentdm::Internal::CallsPage<Sentdm::Models::Call>]
      #
      # @see Sentdm::Models::CallListParams
      def list(params = {})
        query_params = [:direction, :from, :number, :page, :page_size, :status, :to]
        parsed, options = Sentdm::CallListParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v3/calls",
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          page: Sentdm::Internal::CallsPage,
          model: Sentdm::Call,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::CallHangupParams} for more details.
      #
      # Ends one of your live calls. The call then ends the way any other call does once
      # the disconnect is reported: an answered call as COMPLETED with call.completed, a
      # call still ringing as NO_ANSWER, REJECTED or FAILED with call.failed. A call
      # that has already ended answers 409, and so does a call with no phone leg, such
      # as one between two app users.
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
      # @see Sentdm::Models::CallHangupParams
      def hangup(id, params = {})
        parsed, options = Sentdm::CallHangupParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: ["v3/calls/%1$s/hangup", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::CallListRecordingsParams} for more details.
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
      # @return [Sentdm::Models::APIResponseOfCallRecordings]
      #
      # @see Sentdm::Models::CallListRecordingsParams
      def list_recordings(id, params = {})
        parsed, options = Sentdm::CallListRecordingsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/calls/%1$s/recordings", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfCallRecordings,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::CallRecordParams} for more details.
      #
      # Starts or stops recording one of your live calls. Use start to begin recording
      # mid-call, or stop to end a recording, whether it was started here or by a
      # connect answer with record set. A call that has already ended answers 409, and
      # so does a call with no phone leg, such as one between two app users, which can't
      # be recorded.
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
      # @see Sentdm::Models::CallRecordParams
      def record(id, params = {})
        parsed, options = Sentdm::CallRecordParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: ["v3/calls/%1$s/recordings", id],
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
        @participants = Sentdm::Resources::Calls::Participants.new(client: client)
      end
    end
  end
end
