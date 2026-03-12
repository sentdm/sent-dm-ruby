# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo < Sentdm::Internal::Type::BaseModel
      # @!attribute name
      #   Primary contact name (required)
      #
      #   @return [String]
      required :name, String

      # @!attribute business_name
      #   Business/brand name
      #
      #   @return [String, nil]
      optional :business_name, String, api_name: :businessName, nil?: true

      # @!attribute email
      #   Contact email address
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute phone
      #   Contact phone number in E.164 format
      #
      #   @return [String, nil]
      optional :phone, String, nil?: true

      # @!attribute phone_country_code
      #   Contact phone country code (e.g., "1" for US)
      #
      #   @return [String, nil]
      optional :phone_country_code, String, api_name: :phoneCountryCode, nil?: true

      # @!attribute role
      #   Contact's role in the business
      #
      #   @return [String, nil]
      optional :role, String, nil?: true

      # @!method initialize(name:, business_name: nil, email: nil, phone: nil, phone_country_code: nil, role: nil)
      #   Contact information for brand KYC
      #
      #   @param name [String] Primary contact name (required)
      #
      #   @param business_name [String, nil] Business/brand name
      #
      #   @param email [String, nil] Contact email address
      #
      #   @param phone [String, nil] Contact phone number in E.164 format
      #
      #   @param phone_country_code [String, nil] Contact phone country code (e.g., "1" for US)
      #
      #   @param role [String, nil] Contact's role in the business
    end
  end
end
