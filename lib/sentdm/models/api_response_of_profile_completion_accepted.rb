# frozen_string_literal: true

module Sentdm
  module Models
    class APIResponseOfProfileCompletionAccepted < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response acknowledging that profile completion has been accepted and started in
      #   the background. The provided webhook URL will be called when processing
      #   finishes.
      #
      #   @return [Sentdm::Models::ProfileCompletionAccepted, nil]
      optional :data, -> { Sentdm::ProfileCompletionAccepted }, nil?: true

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
      #   {Sentdm::Models::APIResponseOfProfileCompletionAccepted} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ProfileCompletionAccepted, nil] Response acknowledging that profile completion has been accepted and started in
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
