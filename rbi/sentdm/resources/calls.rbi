# typed: strong

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
      sig { returns(Sentdm::Resources::Calls::Participants) }
      attr_reader :participants

      # Retrieves one of your calls by id: the parties, the owning number, the current
      # status with its failure reason, duration, price, recording availability, and a
      # timeline of when the call entered each status.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfCall)
      end
      def retrieve(
        # The call id from the route, as carried by call webhooks and the calls list, for
        # example call_9f2ab000-0000-4000-8000-000000000001
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves a paginated list of your calls, most recent first. Filter by
      # direction, status, the owning number, and the time the call started (from and to
      # are inclusive). Use the call webhooks for real-time updates; this list is for
      # looking calls up afterwards.
      sig do
        params(
          direction: T.nilable(String),
          from: T.nilable(Time),
          number: T.nilable(String),
          page: Integer,
          page_size: Integer,
          status: T.nilable(String),
          to: T.nilable(Time),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Internal::CallsPage[Sentdm::Call])
      end
      def list(
        # Query param: Optional direction filter: outbound for calls placed from your app,
        # inbound for calls to one of your numbers
        direction: nil,
        # Query param: Only calls started at or after this time (ISO 8601)
        from: nil,
        # Query param: Optional filter on the number that owns the call, one of your
        # voice-enabled numbers in E.164 format
        number: nil,
        # Query param: Page number (1-indexed)
        page: nil,
        # Query param: Number of items per page
        page_size: nil,
        # Query param: Optional status filter: initiated, ringing, answered, completed,
        # failed, no_answer or rejected
        status: nil,
        # Query param: Only calls started at or before this time (ISO 8601)
        to: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Ends one of your live calls. The call then ends the way any other call does once
      # the disconnect is reported: an answered call as COMPLETED with call.completed, a
      # call still ringing as NO_ANSWER, REJECTED or FAILED with call.failed. A call
      # that has already ended answers 409, and so does a call with no phone leg, such
      # as one between two app users.
      sig do
        params(
          id: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def hangup(
        # Path param: The call id from the route, as carried by call webhooks and the
        # calls list, for example call_9f2ab000-0000-4000-8000-000000000001
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

      # Returns pre-signed links to the recordings of one of your calls, each valid
      # until its url_expires_at. A recording appears once the call was recorded, by a
      # connect answer with record set, a startRecording instruction or the recordings
      # command, and the call.recording_ready webhook has been sent; until then, and for
      # a call that was never recorded, the list is empty. A call recorded more than
      # once lists every recording, oldest first, each under the recording_id its
      # call.recording_ready webhook carried.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfCallRecordings)
      end
      def list_recordings(
        # The call id from the route, as carried by call webhooks and the calls list, for
        # example call_9f2ab000-0000-4000-8000-000000000001
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Starts or stops recording one of your live calls. Use start to begin recording
      # mid-call, or stop to end a recording, whether it was started here or by a
      # connect answer with record set. A call that has already ended answers 409, and
      # so does a call with no phone leg, such as one between two app users, which can't
      # be recorded.
      sig do
        params(
          id: String,
          action: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def record(
        # Path param: The call id from the route, as carried by call webhooks and the
        # calls list, for example call_9f2ab000-0000-4000-8000-000000000001
        id,
        # Body param: start to begin recording, stop to end it
        action: nil,
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
