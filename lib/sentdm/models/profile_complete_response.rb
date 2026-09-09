# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#complete
    class ProfileCompleteResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response when a profile is already in the completed state and no further action
      #   is taken.
      #
      #   @return [Sentdm::Models::ProfileCompleteResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ProfileCompleteResponse::Data }, nil?: true

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
      #   {Sentdm::Models::ProfileCompleteResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ProfileCompleteResponse::Data, nil] Response when a profile is already in the completed state and no further action
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ProfileCompleteResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable message describing the result.
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute status
        #   Current process status of the profile (e.g., "completed", "submitted",
        #   "in_progress").
        #
        #   @return [String, nil]
        optional :status, String

        # @!method initialize(message: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::ProfileCompleteResponse::Data} for more details.
        #
        #   Response when a profile is already in the completed state and no further action
        #   is taken.
        #
        #   @param message [String] Human-readable message describing the result.
        #
        #   @param status [String] Current process status of the profile (e.g., "completed", "submitted", "in_progr
      end
    end
  end
end
