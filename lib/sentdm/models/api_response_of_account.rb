# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Me#retrieve
    class APIResponseOfAccount < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Account response for GET /v3/me endpoint. Returns organization (with profiles),
      #   user (standalone), or profile (child of an organization) data depending on the
      #   API key type. Always includes messaging channel configuration.
      #
      #   @return [Sentdm::Models::Account, nil]
      optional :data, -> { Sentdm::Account }, nil?: true

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
      #   {Sentdm::Models::APIResponseOfAccount} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::Account, nil] Account response for GET /v3/me endpoint.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
