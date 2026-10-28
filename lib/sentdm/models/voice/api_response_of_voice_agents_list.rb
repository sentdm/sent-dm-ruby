# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class APIResponseOfVoiceAgentsList < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   A page of the account's agents. The agent itself is VoiceAgentResponse, shared
        #   with the admin API.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentsList, nil]
        optional :data, -> { Sentdm::Voice::VoiceAgentsList }, nil?: true

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
        #   {Sentdm::Models::Voice::APIResponseOfVoiceAgentsList} for more details.
        #
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Voice::VoiceAgentsList, nil] A page of the account's agents. The agent itself is VoiceAgentResponse, shared w
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
