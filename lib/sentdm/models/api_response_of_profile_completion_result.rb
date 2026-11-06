# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#complete
    class APIResponseOfProfileCompletionResult < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response when a profile is already in the completed state and no further action
      #   is taken.
      #
      #   @return [Sentdm::Models::ProfileCompletionResult, nil]
      optional :data, -> { Sentdm::ProfileCompletionResult }, nil?: true

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
      #   {Sentdm::Models::APIResponseOfProfileCompletionResult} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ProfileCompletionResult, nil] Response when a profile is already in the completed state and no further action
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
