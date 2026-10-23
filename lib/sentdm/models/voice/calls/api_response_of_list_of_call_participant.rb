# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      module Calls
        # @see Sentdm::Resources::Voice::Calls::Participants#list
        class APIResponseOfListOfCallParticipant < Sentdm::Internal::Type::BaseModel
          # @!attribute data
          #   The response data (null if error)
          #
          #   @return [Array<Sentdm::Models::Voice::Calls::CallParticipant>, nil]
          optional :data,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::Calls::CallParticipant]
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
          #   @param data [Array<Sentdm::Models::Voice::Calls::CallParticipant>, nil] The response data (null if error)
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
end
