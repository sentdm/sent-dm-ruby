# frozen_string_literal: true

module Sentdm
  module Models
    class BrandData < Sentdm::Internal::Type::BaseModel
      # @!attribute compliance
      #   Compliance and TCR-related information
      #
      #   @return [Sentdm::Models::BrandData::Compliance]
      required :compliance, -> { Sentdm::BrandData::Compliance }

      # @!attribute contact
      #   Contact information for the brand
      #
      #   @return [Sentdm::Models::BrandData::Contact]
      required :contact, -> { Sentdm::BrandData::Contact }

      # @!attribute business
      #   Business details and address information
      #
      #   @return [Sentdm::Models::BrandData::Business, nil]
      optional :business, -> { Sentdm::BrandData::Business }, nil?: true

      # @!method initialize(compliance:, contact:, business: nil)
      #   Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @param compliance [Sentdm::Models::BrandData::Compliance] Compliance and TCR-related information
      #
      #   @param contact [Sentdm::Models::BrandData::Contact] Contact information for the brand
      #
      #   @param business [Sentdm::Models::BrandData::Business, nil] Business details and address information

      # @see Sentdm::Models::BrandData#compliance
      class Compliance < Sentdm::Internal::Type::BaseModel
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
        #   Compliance and TCR-related information
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

      # @see Sentdm::Models::BrandData#contact
      class Contact < Sentdm::Internal::Type::BaseModel
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
        #   Contact information for the brand
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

      # @see Sentdm::Models::BrandData#business
      class Business < Sentdm::Internal::Type::BaseModel
        # @!attribute city
        #   City
        #
        #   @return [String, nil]
        optional :city, String, nil?: true

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

        # @!attribute entity_type
        #   Business entity type
        #
        #   @return [Symbol, Sentdm::Models::BrandData::Business::EntityType, nil]
        optional :entity_type,
                 enum: -> { Sentdm::BrandData::Business::EntityType },
                 api_name: :entityType,
                 nil?: true

        # @!attribute legal_name
        #   Legal business name
        #
        #   @return [String, nil]
        optional :legal_name, String, api_name: :legalName, nil?: true

        # @!attribute postal_code
        #   Postal/ZIP code
        #
        #   @return [String, nil]
        optional :postal_code, String, api_name: :postalCode, nil?: true

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

        # @!attribute url
        #   Business website URL
        #
        #   @return [String, nil]
        optional :url, String, nil?: true

        # @!method initialize(city: nil, country: nil, country_of_registration: nil, entity_type: nil, legal_name: nil, postal_code: nil, state: nil, street: nil, tax_id: nil, tax_id_type: nil, url: nil)
        #   Business details and address information
        #
        #   @param city [String, nil] City
        #
        #   @param country [String, nil] Country code (e.g., US, CA)
        #
        #   @param country_of_registration [String, nil] Country where the business is registered
        #
        #   @param entity_type [Symbol, Sentdm::Models::BrandData::Business::EntityType, nil] Business entity type
        #
        #   @param legal_name [String, nil] Legal business name
        #
        #   @param postal_code [String, nil] Postal/ZIP code
        #
        #   @param state [String, nil] State/province code
        #
        #   @param street [String, nil] Street address
        #
        #   @param tax_id [String, nil] Tax ID/EIN number
        #
        #   @param tax_id_type [String, nil] Type of tax ID (e.g., us_ein, ca_bn)
        #
        #   @param url [String, nil] Business website URL

        # Business entity type
        #
        # @see Sentdm::Models::BrandData::Business#entity_type
        module EntityType
          extend Sentdm::Internal::Type::Enum

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
end
