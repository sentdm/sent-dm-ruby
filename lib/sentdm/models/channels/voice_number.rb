# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceNumber < Sentdm::Internal::Type::BaseModel
        # @!attribute agent_id
        #   The voice agent calls to this number go to, such as
        #   agent_9f2ab000-0000-4000-8000-000000000001. It wins over callback_url for calls
        #   to the number; calls your app places from the number still follow your app. Null
        #   when no agent answers the number.
        #
        #   @return [String, nil]
        optional :agent_id, String, nil?: true

        # @!attribute callback_url
        #   Where Sent asks what to do with each call on this number: a signed question is
        #   POSTed here when a call arrives or a caller presses a key, and the answer
        #   decides the call. The signing secret is not on this read; it is shown when voice
        #   is turned on and by the rotate endpoint.
        #
        #   @return [String, nil]
        optional :callback_url, String, nil?: true

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute default_for_app_calls
        #   Whether this is the line app-originated calls are placed from when a voice token
        #   names no number. Exactly one active voice number carries it while the profile
        #   has any.
        #
        #   @return [Boolean, nil]
        optional :default_for_app_calls, Sentdm::Internal::Type::Boolean

        # @!attribute number
        #   The number, in E.164.
        #
        #   @return [String, nil]
        optional :number, String

        # @!attribute routes_to
        #   Who answers calls to this number: agent, the voice agent in agent_id;
        #   agent_pending, that agent once the number has finished moving to it, with calls
        #   possibly unanswered until then; callback, your callback_url; or none, in which
        #   case calls to it are declined.
        #
        #   @return [String, nil]
        optional :routes_to, String

        # @!attribute status
        #   ACTIVE while the number carries calls, INACTIVE once it was turned off. Nothing
        #   provisions: a number the customer holds can carry calls the moment voice is
        #   turned on for it.
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time

        # @!method initialize(agent_id: nil, callback_url: nil, created_at: nil, default_for_app_calls: nil, number: nil, routes_to: nil, status: nil, updated_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceNumber} for more details.
        #
        #   One number the profile carries phone calls on.
        #
        #   @param agent_id [String, nil] The voice agent calls to this number go to, such as agent_9f2ab000-0000-4000-800
        #
        #   @param callback_url [String, nil] Where Sent asks what to do with each call on this number: a signed question is P
        #
        #   @param created_at [Time]
        #
        #   @param default_for_app_calls [Boolean] Whether this is the line app-originated calls are placed from when a voice token
        #
        #   @param number [String] The number, in E.164.
        #
        #   @param routes_to [String] Who answers calls to this number: agent, the voice agent in agent_id;
        #
        #   @param status [String] ACTIVE while the number carries calls, INACTIVE once it was turned off. Nothing
        #
        #   @param updated_at [Time]
      end
    end
  end
end
