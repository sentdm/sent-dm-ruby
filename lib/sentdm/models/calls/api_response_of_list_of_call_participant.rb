# frozen_string_literal: true

module Sentdm
  module Models
    module Calls
      class APIResponseOfListOfCallParticipant < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   The response data (null if error)
        #
        #   @return [Array<Sentdm::Models::Calls::APIResponseOfListOfCallParticipant::Data>, nil]
        optional :data,
                 -> {
                   Sentdm::Internal::Type::ArrayOf[Sentdm::Calls::APIResponseOfListOfCallParticipant::Data]
                 },
                 nil?: true

        # @!attribute error
        #   Error information
        #
        #   @return [Sentdm::Models::ErrorDetail, nil]
        optional :error, -> { Sentdm::ErrorDetail }, nil?: true

        # @!attribute meta
        #   Request and response metadata
        #
        #   @return [Sentdm::Models::APIMeta, nil]
        optional :meta, -> { Sentdm::APIMeta }

        # @!attribute success
        #   Indicates whether the request was successful
        #
        #   @return [Boolean, nil]
        optional :success, Sentdm::Internal::Type::Boolean

        # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Array<Sentdm::Models::Calls::APIResponseOfListOfCallParticipant::Data>, nil] The response data (null if error)
        #
        #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
        #
        #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful

        class Data < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #   The participant's own call id: what the mute and remove endpoints take, and what
          #   GET /v3/voice/calls/{id} accepts
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
          #   {Sentdm::Models::Calls::APIResponseOfListOfCallParticipant::Data} for more
          #   details.
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
    end
  end
end
