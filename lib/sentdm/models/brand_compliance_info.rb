# frozen_string_literal: true

module Sentdm
  module Models
    class BrandComplianceInfo < Sentdm::Internal::Type::BaseModel
      # @!attribute brand_relationship
      #
      #   @return [Symbol, Sentdm::Models::TcrBrandRelationship]
      required :brand_relationship, enum: -> { Sentdm::TcrBrandRelationship }, api_name: :brandRelationship

      # @!attribute vertical
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

      # @!method initialize(brand_relationship:, vertical:, destination_countries: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil)
      #   Compliance and TCR information for brand registration
      #
      #   @param brand_relationship [Symbol, Sentdm::Models::TcrBrandRelationship]
      #
      #   @param vertical [Symbol, Sentdm::Models::TcrVertical]
      #
      #   @param destination_countries [Array<Sentdm::Models::DestinationCountry>, nil] List of destination countries for messaging
      #
      #   @param is_tcr_application [Boolean, nil] Whether this is a TCR (Campaign Registry) application
      #
      #   @param notes [String, nil] Additional notes about the business or use case
      #
      #   @param phone_number_prefix [String, nil] Phone number prefix for messaging (e.g., "+1")
    end
  end
end
