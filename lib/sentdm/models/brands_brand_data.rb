# frozen_string_literal: true

module Sentdm
  module Models
    class BrandsBrandData < Sentdm::Internal::Type::BaseModel
      # @!attribute compliance
      #   Compliance and TCR-related information
      #
      #   @return [Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo]
      required :compliance,
               -> { Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo }

      # @!attribute contact
      #   Contact information for the brand
      #
      #   @return [Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo]
      required :contact,
               -> { Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo }

      # @!attribute business
      #   Business details and address information
      #
      #   @return [Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo, nil]
      optional :business,
               -> { Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo },
               nil?: true

      # @!method initialize(compliance:, contact:, business: nil)
      #   Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @param compliance [Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo] Compliance and TCR-related information
      #
      #   @param contact [Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo] Contact information for the brand
      #
      #   @param business [Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo, nil] Business details and address information
    end
  end
end
