# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Agents#rotate_secret
      class APIResponseOfVoiceAgentSecret < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   A freshly rotated signing secret.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentSecret, nil]
        optional :data, -> { Sentdm::Voice::VoiceAgentSecret }, nil?: true

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
        #   @param data [Sentdm::Models::Voice::VoiceAgentSecret, nil] A freshly rotated signing secret.
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
