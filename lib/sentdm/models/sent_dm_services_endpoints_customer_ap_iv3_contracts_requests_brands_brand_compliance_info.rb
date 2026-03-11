# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo < Sentdm::Internal::Type::BaseModel
      # @!attribute brand_relationship
      #   Brand relationship level with TCR (required for TCR)
      #
      #   @return [Symbol, Sentdm::Models::TcrBrandRelationship]
      required :brand_relationship, enum: -> { Sentdm::TcrBrandRelationship }, api_name: :brandRelationship

      # @!attribute vertical
      #   Business vertical/industry category (required for TCR)
      #
      #   @return [Symbol, Sentdm::Models::TcrVertical]
      required :vertical, enum: -> { Sentdm::TcrVertical }

      # @!attribute destination_countries
      #   List of destination countries for messaging
      #
      #   @return [Array<Sentdm::Models::DestinationCountry>, nil]
      optional :destination_countries,
               -> { Sentdm::Internal::Type::ArrayOf[Sentdm::DestinationCountry] },
               api_name: :destinationCountries,
               nil?: true

      # @!attribute expected_messaging_volume
      #   Expected daily messaging volume
      #
      #   @return [String, nil]
      optional :expected_messaging_volume, String, api_name: :expectedMessagingVolume, nil?: true

      # @!attribute is_tcr_application
      #   Whether this is a TCR (Campaign Registry) application
      #
      #   @return [Boolean, nil]
      optional :is_tcr_application, Sentdm::Internal::Type::Boolean, api_name: :isTcrApplication, nil?: true

      # @!attribute notes
      #   Additional notes about the business or use case
      #
      #   @return [String, nil]
      optional :notes, String, nil?: true

      # @!attribute phone_number_prefix
      #   Phone number prefix for messaging (e.g., "+1")
      #
      #   @return [String, nil]
      optional :phone_number_prefix, String, api_name: :phoneNumberPrefix, nil?: true

      # @!attribute primary_use_case
      #   Primary messaging use case description
      #
      #   @return [String, nil]
      optional :primary_use_case, String, api_name: :primaryUseCase, nil?: true

      # @!method initialize(brand_relationship:, vertical:, destination_countries: nil, expected_messaging_volume: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil, primary_use_case: nil)
      #   Compliance and TCR information for brand registration
      #
      #   @param brand_relationship [Symbol, Sentdm::Models::TcrBrandRelationship] Brand relationship level with TCR (required for TCR)
      #
      #   @param vertical [Symbol, Sentdm::Models::TcrVertical] Business vertical/industry category (required for TCR)
      #
      #   @param destination_countries [Array<Sentdm::Models::DestinationCountry>, nil] List of destination countries for messaging
      #
      #   @param expected_messaging_volume [String, nil] Expected daily messaging volume
      #
      #   @param is_tcr_application [Boolean, nil] Whether this is a TCR (Campaign Registry) application
      #
      #   @param notes [String, nil] Additional notes about the business or use case
      #
      #   @param phone_number_prefix [String, nil] Phone number prefix for messaging (e.g., "+1")
      #
      #   @param primary_use_case [String, nil] Primary messaging use case description
    end
  end
end
