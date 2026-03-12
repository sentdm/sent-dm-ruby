# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#create
    class APIResponseOfContact < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Contact response for v3 API Uses snake_case for JSON property names
      #
      #   @return [Sentdm::Models::ContactResponse, nil]
      optional :data, -> { Sentdm::ContactResponse }, nil?: true

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
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::APIResponseOfContact} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ContactResponse, nil] Contact response for v3 API
      #
      #   @param error [Sentdm::Models::APIError, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
