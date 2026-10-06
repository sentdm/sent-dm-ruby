# typed: strong

module Sentdm
  module Resources
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
      class Participants
        # Mutes or unmutes one participant of the conference room a live call is in, named
        # by the participant's own call id from the participants list: send muted true to
        # silence them, muted false to let them be heard again. Muting a participant who
        # is already muted succeeds, as does unmuting one who is not. A participant who is
        # not in this call's room answers 404. A call that has ended answers 409, as does
        # a call that is not in a conference.
        sig do
          params(
            participant_id: String,
            id: String,
            muted: T::Boolean,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).void
        end
        def update(
          # Path param: The participant's own call id from the route, as listed by the
          # participants endpoint, for example call_9f2ab000-0000-4000-8000-000000000002
          participant_id,
          # Path param: The call id from the route, as carried by call webhooks and the
          # calls list, for example call_9f2ab000-0000-4000-8000-000000000001
          id:,
          # Body param: true to mute the participant, false to unmute them
          muted: nil,
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

        # Lists who is in the conference room one of your live calls is in: each
        # participant's own call id, who they are, whether the room mutes them, and how
        # long they have been connected. The call itself is one of the participants. Use a
        # participant's id to mute or remove them; it is also a call id, so GET
        # /v3/calls/{id} accepts it. A call that has ended answers 409, as does a call
        # that is not in a conference.
        sig do
          params(
            id: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Calls::APIResponseOfListOfCallParticipant)
        end
        def list(
          # The call id from the route, as carried by call webhooks and the calls list, for
          # example call_9f2ab000-0000-4000-8000-000000000001
          id,
          # Profile UUID to scope the request to a child profile. Only organization API keys
          # can use this header. The profile must belong to the calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Dials one of your app users or a phone number into a call that is in a
        # conference room, and answers with the participant's own call record. The
        # participant is a call of their own: it has its own id, can be looked up and hung
        # up, and is billed and reported through call.completed and call.failed like any
        # other call. Every participant needs a positive balance. A phone participant is
        # called from caller_id, which must be one of your numbers, or from the call's
        # owning number when omitted, and needs a destination you may call. Only a call
        # your answer connected to a conference can take participants: a call connected to
        # a user or a number answers 409.
        sig do
          params(
            id: String,
            caller_id: T.nilable(String),
            sandbox: T::Boolean,
            to: Sentdm::Calls::CallParticipantTarget::OrHash,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::APIResponseOfCall)
        end
        def add(
          # Path param: The call id from the route, as carried by call webhooks and the
          # calls list, for example call_9f2ab000-0000-4000-8000-000000000001
          id,
          # Body param: The number shown to a phone participant as the caller, in E.164
          # format. Must be one of your numbers. The call's owning number when omitted
          caller_id: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Body param: A participant to add to a call
          to: nil,
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

        # Removes one participant from the conference room a live call is in, named by the
        # participant's own call id from the participants list. Their leg ends and is
        # reported through call.completed like any other call; everyone else stays
        # connected. A participant who is not in this call's room answers 404. A call that
        # has ended answers 409, as does a call that is not in a conference.
        sig do
          params(
            participant_id: String,
            id: String,
            sandbox: T::Boolean,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).void
        end
        def remove(
          # Path param: The participant's own call id from the route, as listed by the
          # participants endpoint, for example call_9f2ab000-0000-4000-8000-000000000002
          participant_id,
          # Path param: The call id from the route, as carried by call webhooks and the
          # calls list, for example call_9f2ab000-0000-4000-8000-000000000001
          id:,
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

        # Removes every participant from the conference room a live call is in, the call
        # itself included. Every leg ends and is reported through call.completed like any
        # other call. A room that is already empty answers 204 as well. A call that has
        # ended answers 409, as does a call that is not in a conference.
        sig do
          params(
            id: String,
            sandbox: T::Boolean,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).void
        end
        def remove_all(
          # Path param: The call id from the route, as carried by call webhooks and the
          # calls list, for example call_9f2ab000-0000-4000-8000-000000000001
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

        # @api private
        sig { params(client: Sentdm::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
