# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Catalogue#list
      class APIResponseOfVoiceCatalogue < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   The voices and languages a text-session agent may name in its speech settings:
        #   what GET /v3/voice/voices and the admin GET /voice/voices answer, in one shape.
        #
        #   @return [Sentdm::Models::Voice::VoiceCatalogue, nil]
        optional :data, -> { Sentdm::Voice::VoiceCatalogue }, nil?: true

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
        #   {Sentdm::Models::Voice::APIResponseOfVoiceCatalogue} for more details.
        #
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Voice::VoiceCatalogue, nil] The voices and languages a text-session agent may name in its speech settings: w
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
