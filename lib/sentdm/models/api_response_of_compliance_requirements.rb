# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Compliance#retrieve_requirements
    class APIResponseOfComplianceRequirements < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Everything a market expects of a sender, for one channel, country and sender
      #   type.
      #
      #   @return [Sentdm::Models::ComplianceRequirements, nil]
      optional :data, -> { Sentdm::ComplianceRequirements }, nil?: true

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
      #   {Sentdm::Models::APIResponseOfComplianceRequirements} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ComplianceRequirements, nil] Everything a market expects of a sender, for one channel, country and sender typ
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
