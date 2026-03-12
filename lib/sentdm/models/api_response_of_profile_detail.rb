# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#create
    class APIResponseOfProfileDetail < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Detailed profile response for v3 API
      #
      #   @return [Sentdm::Models::ProfileDetail, nil]
      optional :data, -> { Sentdm::ProfileDetail }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

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
      #   @param data [Sentdm::Models::ProfileDetail, nil] Detailed profile response for v3 API
      #
      #   @param error [Sentdm::Models::APIError, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
