# frozen_string_literal: true

module Sentdm
  module Models
    class BrandsBrandData < Sentdm::Internal::Type::BaseModel
      # @!attribute compliance
      #   Compliance and TCR information for brand registration
      #
      #   @return [Sentdm::Models::BrandComplianceInfo]
      required :compliance, -> { Sentdm::BrandComplianceInfo }

      # @!attribute contact
      #   Contact information for brand KYC
      #
      #   @return [Sentdm::Models::BrandContactInfo]
      required :contact, -> { Sentdm::BrandContactInfo }

      # @!attribute business
      #   Business details and address for brand KYC
      #
      #   @return [Sentdm::Models::BrandBusinessInfo, nil]
      optional :business, -> { Sentdm::BrandBusinessInfo }, nil?: true

      # @!method initialize(compliance:, contact:, business: nil)
      #   Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @param compliance [Sentdm::Models::BrandComplianceInfo] Compliance and TCR information for brand registration
      #
      #   @param contact [Sentdm::Models::BrandContactInfo] Contact information for brand KYC
      #
      #   @param business [Sentdm::Models::BrandBusinessInfo, nil] Business details and address for brand KYC
    end
  end
end
