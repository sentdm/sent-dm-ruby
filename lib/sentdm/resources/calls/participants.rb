# frozen_string_literal: true

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
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Calls::ParticipantUpdateParams} for more details.
        #
        # Mutes or unmutes one participant of the conference room a live call is in, named
        # by the participant's own call id from the participants list: send muted true to
        # silence them, muted false to let them be heard again. Muting a participant who
        # is already muted succeeds, as does unmuting one who is not. A participant who is
        # not in this call's room answers 404. A call that has ended answers 409, as does
        # a call that is not in a conference.
        #
        # @overload update(participant_id, id:, muted: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param participant_id [String] Path param: The participant's own call id from the route, as listed by the parti
        #
        # @param id [String] Path param: The call id from the route, as carried by call webhooks and the call
        #
        # @param muted [Boolean] Body param: true to mute the participant, false to unmute them
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
        # @see Sentdm::Models::Calls::ParticipantUpdateParams
        def update(participant_id, params)
          parsed, options = Sentdm::Calls::ParticipantUpdateParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :patch,
            path: ["v3/calls/%1$s/participants/%2$s", id, participant_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Calls::ParticipantListParams} for more details.
        #
        # Lists who is in the conference room one of your live calls is in: each
        # participant's own call id, who they are, whether the room mutes them, and how
        # long they have been connected. The call itself is one of the participants. Use a
        # participant's id to mute or remove them; it is also a call id, so GET
        # /v3/calls/{id} accepts it. A call that has ended answers 409, as does a call
        # that is not in a conference.
        #
        # @overload list(id, x_profile_id: nil, request_options: {})
        #
        # @param id [String] The call id from the route, as carried by call webhooks and the calls list, for
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Calls::APIResponseOfListOfCallParticipant]
        #
        # @see Sentdm::Models::Calls::ParticipantListParams
        def list(id, params = {})
          parsed, options = Sentdm::Calls::ParticipantListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/calls/%1$s/participants", id],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Calls::APIResponseOfListOfCallParticipant,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Calls::ParticipantAddParams} for more details.
        #
        # Dials one of your app users or a phone number into a call that is in a
        # conference room, and answers with the participant's own call record. The
        # participant is a call of their own: it has its own id, can be looked up and hung
        # up, and is billed and reported through call.completed and call.failed like any
        # other call. A phone participant is called from caller_id, which must be one of
        # your numbers, or from the call's owning number when omitted, and needs a
        # destination you may call and a positive balance. Only a call your answer
        # connected to a conference can take participants: a call connected to a user or a
        # number answers 409.
        #
        # @overload add(id, caller_id: nil, sandbox: nil, to: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The call id from the route, as carried by call webhooks and the call
        #
        # @param caller_id [String, nil] Body param: The number shown to a phone participant as the caller, in E.164 form
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param to [Sentdm::Models::Calls::CallParticipantTarget] Body param: A participant to add to a call
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::APIResponseOfCall]
        #
        # @see Sentdm::Models::Calls::ParticipantAddParams
        def add(id, params = {})
          parsed, options = Sentdm::Calls::ParticipantAddParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/calls/%1$s/participants", id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::APIResponseOfCall,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Calls::ParticipantRemoveParams} for more details.
        #
        # Removes one participant from the conference room a live call is in, named by the
        # participant's own call id from the participants list. Their leg ends and is
        # reported through call.completed like any other call; everyone else stays
        # connected. A participant who is not in this call's room answers 404. A call that
        # has ended answers 409, as does a call that is not in a conference.
        #
        # @overload remove(participant_id, id:, sandbox: nil, x_profile_id: nil, request_options: {})
        #
        # @param participant_id [String] Path param: The participant's own call id from the route, as listed by the parti
        #
        # @param id [String] Path param: The call id from the route, as carried by call webhooks and the call
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Calls::ParticipantRemoveParams
        def remove(participant_id, params)
          parsed, options = Sentdm::Calls::ParticipantRemoveParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {x_profile_id: "x-profile-id"}
          @client.request(
            method: :delete,
            path: ["v3/calls/%1$s/participants/%2$s", id, participant_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Calls::ParticipantRemoveAllParams} for more details.
        #
        # Removes every participant from the conference room a live call is in, the call
        # itself included. Every leg ends and is reported through call.completed like any
        # other call. A room that is already empty answers 204 as well. A call that has
        # ended answers 409, as does a call that is not in a conference.
        #
        # @overload remove_all(id, sandbox: nil, x_profile_id: nil, request_options: {})
        #
        # @param id [String] Path param: The call id from the route, as carried by call webhooks and the call
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Calls::ParticipantRemoveAllParams
        def remove_all(id, params = {})
          parsed, options = Sentdm::Calls::ParticipantRemoveAllParams.dump_request(params)
          header_params = {x_profile_id: "x-profile-id"}
          @client.request(
            method: :delete,
            path: ["v3/calls/%1$s/participants", id],
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
        end
      end
    end
  end
end
