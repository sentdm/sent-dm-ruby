# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Agents#create
      class APIResponseOfVoiceAgent < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   A voice agent as stored: what was written with every default filled in, plus the
        #   signing secret the one time it is shown (on create, and on rotate). The one
        #   shape every read of an agent answers with, on /v3/voice/agents and on the admin
        #   API the dashboard uses, so the two cannot drift.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgent, nil]
        optional :data, -> { Sentdm::Voice::VoiceAgent }, nil?: true

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
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::APIResponseOfVoiceAgent} for more details.
        #
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Voice::VoiceAgent, nil] A voice agent as stored: what was written with every default filled in, plus the
        #
        #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
        #
        #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
        #
        #   @param success [Boolean] Indicates whether the request was successful
      end
    end
  end
end
