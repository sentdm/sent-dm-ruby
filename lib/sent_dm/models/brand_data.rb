# frozen_string_literal: true

module SentDm
  module Models
    class BrandData < SentDm::Internal::Type::BaseModel
      # @!attribute brand_relationship
      #   Brand relationship level with TCR (required for TCR)
      #
      #   @return [Symbol, SentDm::Models::TcrBrandRelationship]
      required :brand_relationship, enum: -> { SentDm::TcrBrandRelationship }, api_name: :brandRelationship

      # @!attribute contact_name
      #   Primary contact name (required)
      #
      #   @return [String]
      required :contact_name, String, api_name: :contactName

      # @!attribute vertical
      #   Business vertical/industry category (required for TCR)
      #
      #   @return [Symbol, SentDm::Models::TcrVertical]
      required :vertical, enum: -> { SentDm::TcrVertical }

      # @!attribute brand_name
      #   Brand name for KYC submission
      #
      #   @return [String, nil]
      optional :brand_name, String, api_name: :brandName, nil?: true

      # @!attribute business_legal_name
      #   Legal business name
      #
      #   @return [String, nil]
      optional :business_legal_name, String, api_name: :businessLegalName, nil?: true

      # @!attribute business_name
      #   Business/brand name
      #
      #   @return [String, nil]
      optional :business_name, String, api_name: :businessName, nil?: true

      # @!attribute business_role
      #   Contact's role in the business
      #
      #   @return [String, nil]
      optional :business_role, String, api_name: :businessRole, nil?: true

      # @!attribute business_url
      #   Business website URL
      #
      #   @return [String, nil]
      optional :business_url, String, api_name: :businessUrl, nil?: true

      # @!attribute city
      #   City
      #
      #   @return [String, nil]
      optional :city, String, nil?: true

      # @!attribute contact_email
      #   Contact email address
      #
      #   @return [String, nil]
      optional :contact_email, String, api_name: :contactEmail, nil?: true

      # @!attribute contact_phone
      #   Contact phone number in E.164 format
      #
      #   @return [String, nil]
      optional :contact_phone, String, api_name: :contactPhone, nil?: true

      # @!attribute contact_phone_country_code
      #   Contact phone country code (e.g., "1" for US)
      #
      #   @return [String, nil]
      optional :contact_phone_country_code, String, api_name: :contactPhoneCountryCode, nil?: true

      # @!attribute country
      #   Country code (e.g., US, CA)
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute country_of_registration
      #   Country where the business is registered
      #
      #   @return [String, nil]
      optional :country_of_registration, String, api_name: :countryOfRegistration, nil?: true

      # @!attribute destination_countries
      #   List of destination countries for messaging
      #
      #   @return [Array<SentDm::Models::DestinationCountry>, nil]
      optional :destination_countries,
               -> { SentDm::Internal::Type::ArrayOf[SentDm::DestinationCountry] },
               api_name: :destinationCountries,
               nil?: true

      # @!attribute entity_type
      #   Business entity type
      #
      #   @return [Symbol, SentDm::Models::BrandData::EntityType, nil]
      optional :entity_type, enum: -> { SentDm::BrandData::EntityType }, api_name: :entityType, nil?: true

      # @!attribute expected_messaging_volume
      #   Expected daily messaging volume
      #
      #   @return [String, nil]
      optional :expected_messaging_volume, String, api_name: :expectedMessagingVolume, nil?: true

      # @!attribute is_tcr_application
      #   Whether this is a TCR (Campaign Registry) application
      #
      #   @return [Boolean, nil]
      optional :is_tcr_application, SentDm::Internal::Type::Boolean, api_name: :isTcrApplication, nil?: true

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

      # @!attribute postal_code
      #   Postal/ZIP code
      #
      #   @return [String, nil]
      optional :postal_code, String, api_name: :postalCode, nil?: true

      # @!attribute primary_use_case
      #   Primary messaging use case description
      #
      #   @return [String, nil]
      optional :primary_use_case, String, api_name: :primaryUseCase, nil?: true

      # @!attribute state
      #   State/province code
      #
      #   @return [String, nil]
      optional :state, String, nil?: true

      # @!attribute street
      #   Street address
      #
      #   @return [String, nil]
      optional :street, String, nil?: true

      # @!attribute tax_id
      #   Tax ID/EIN number
      #
      #   @return [String, nil]
      optional :tax_id, String, api_name: :taxId, nil?: true

      # @!attribute tax_id_type
      #   Type of tax ID (e.g., us_ein, ca_bn)
      #
      #   @return [String, nil]
      optional :tax_id_type, String, api_name: :taxIdType, nil?: true

      # @!method initialize(brand_relationship:, contact_name:, vertical:, brand_name: nil, business_legal_name: nil, business_name: nil, business_role: nil, business_url: nil, city: nil, contact_email: nil, contact_phone: nil, contact_phone_country_code: nil, country: nil, country_of_registration: nil, destination_countries: nil, entity_type: nil, expected_messaging_volume: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil, postal_code: nil, primary_use_case: nil, state: nil, street: nil, tax_id: nil, tax_id_type: nil)
      #   Brand and KYC data
      #
      #   @param brand_relationship [Symbol, SentDm::Models::TcrBrandRelationship] Brand relationship level with TCR (required for TCR)
      #
      #   @param contact_name [String] Primary contact name (required)
      #
      #   @param vertical [Symbol, SentDm::Models::TcrVertical] Business vertical/industry category (required for TCR)
      #
      #   @param brand_name [String, nil] Brand name for KYC submission
      #
      #   @param business_legal_name [String, nil] Legal business name
      #
      #   @param business_name [String, nil] Business/brand name
      #
      #   @param business_role [String, nil] Contact's role in the business
      #
      #   @param business_url [String, nil] Business website URL
      #
      #   @param city [String, nil] City
      #
      #   @param contact_email [String, nil] Contact email address
      #
      #   @param contact_phone [String, nil] Contact phone number in E.164 format
      #
      #   @param contact_phone_country_code [String, nil] Contact phone country code (e.g., "1" for US)
      #
      #   @param country [String, nil] Country code (e.g., US, CA)
      #
      #   @param country_of_registration [String, nil] Country where the business is registered
      #
      #   @param destination_countries [Array<SentDm::Models::DestinationCountry>, nil] List of destination countries for messaging
      #
      #   @param entity_type [Symbol, SentDm::Models::BrandData::EntityType, nil] Business entity type
      #
      #   @param expected_messaging_volume [String, nil] Expected daily messaging volume
      #
      #   @param is_tcr_application [Boolean, nil] Whether this is a TCR (Campaign Registry) application
      #
      #   @param notes [String, nil] Additional notes about the business or use case
      #
      #   @param phone_number_prefix [String, nil] Phone number prefix for messaging (e.g., "+1")
      #
      #   @param postal_code [String, nil] Postal/ZIP code
      #
      #   @param primary_use_case [String, nil] Primary messaging use case description
      #
      #   @param state [String, nil] State/province code
      #
      #   @param street [String, nil] Street address
      #
      #   @param tax_id [String, nil] Tax ID/EIN number
      #
      #   @param tax_id_type [String, nil] Type of tax ID (e.g., us_ein, ca_bn)

      # Business entity type
      #
      # @see SentDm::Models::BrandData#entity_type
      module EntityType
        extend SentDm::Internal::Type::Enum

        PRIVATE_PROFIT = :PRIVATE_PROFIT
        PUBLIC_PROFIT = :PUBLIC_PROFIT
        NON_PROFIT = :NON_PROFIT
        SOLE_PROPRIETOR = :SOLE_PROPRIETOR
        GOVERNMENT = :GOVERNMENT

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
