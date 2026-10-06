# frozen_string_literal: true

module Sentdm
  module Models
    module Calls
      class CallParticipant < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   The participant's own call id: what the mute and remove endpoints take, and what
        #   GET /v3/calls/{id} accepts
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute duration_seconds
        #   How long the participant has been connected to the room, in seconds
        #
        #   @return [Integer, nil]
        optional :duration_seconds, Integer

        # @!attribute kind
        #   user for one of your app users, number for a phone number, anonymous for a
        #   caller who withheld their number
        #
        #   @return [String, nil]
        optional :kind, String

        # @!attribute muted
        #   True while the room mutes this participant
        #
        #   @return [Boolean, nil]
        optional :muted, Sentdm::Internal::Type::Boolean

        # @!attribute value
        #   The app user's identity or the phone number in E.164 format. Null when the kind
        #   is anonymous
        #
        #   @return [String, nil]
        optional :value, String, nil?: true

        # @!method initialize(id: nil, duration_seconds: nil, kind: nil, muted: nil, value: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Calls::CallParticipant} for more details.
        #
        #   A participant of a conference call
        #
        #   @param id [String] The participant's own call id: what the mute and remove endpoints take, and what
        #
        #   @param duration_seconds [Integer] How long the participant has been connected to the room, in seconds
        #
        #   @param kind [String] user for one of your app users, number for a phone number, anonymous for a calle
        #
        #   @param muted [Boolean] True while the room mutes this participant
        #
        #   @param value [String, nil] The app user's identity or the phone number in E.164 format. Null when the kind
      end
    end

    CallParticipant = Calls::CallParticipant
  end
end
