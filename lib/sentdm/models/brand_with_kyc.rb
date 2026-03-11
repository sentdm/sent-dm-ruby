# frozen_string_literal: true

module Sentdm
  module Models
    class BrandWithKYC < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the brand
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute business
      #   Business details and address information
      #
      #   @return [Sentdm::Models::BrandWithKYC::Business, nil]
      optional :business, -> { Sentdm::BrandWithKYC::Business }, nil?: true

      # @!attribute compliance
      #   Compliance and TCR-related information
      #
      #   @return [Sentdm::Models::BrandWithKYC::Compliance, nil]
      optional :compliance, -> { Sentdm::BrandWithKYC::Compliance }, nil?: true

      # @!attribute contact
      #   Contact information for the brand
      #
      #   @return [Sentdm::Models::BrandWithKYC::Contact, nil]
      optional :contact, -> { Sentdm::BrandWithKYC::Contact }, nil?: true

      # @!attribute created_at
      #   When the brand was created
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute csp_id
      #   CSP (Campaign Service Provider) ID
      #
      #   @return [String, nil]
      optional :csp_id, String, nil?: true

      # @!attribute identity_status
      #   TCR brand identity verification status
      #
      #   @return [Symbol, Sentdm::Models::BrandWithKYC::IdentityStatus, nil]
      optional :identity_status, enum: -> { Sentdm::BrandWithKYC::IdentityStatus }, nil?: true

      # @!attribute is_inherited
      #   Whether this brand is inherited from the parent organization
      #
      #   @return [Boolean, nil]
      optional :is_inherited, Sentdm::Internal::Type::Boolean

      # @!attribute status
      #   TCR brand status
      #
      #   @return [Symbol, Sentdm::Models::BrandWithKYC::Status, nil]
      optional :status, enum: -> { Sentdm::BrandWithKYC::Status }, nil?: true

      # @!attribute submitted_at
      #   When the brand was submitted to TCR
      #
      #   @return [Time, nil]
      optional :submitted_at, Time, nil?: true

      # @!attribute submitted_to_tcr
      #   Whether this brand has been submitted to TCR
      #
      #   @return [Boolean, nil]
      optional :submitted_to_tcr, Sentdm::Internal::Type::Boolean

      # @!attribute tcr_brand_id
      #   TCR brand ID (populated after TCR submission)
      #
      #   @return [String, nil]
      optional :tcr_brand_id, String, nil?: true

      # @!attribute universal_ein
      #   Universal EIN from TCR
      #
      #   @return [String, nil]
      optional :universal_ein, String, nil?: true

      # @!attribute updated_at
      #   When the brand was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!method initialize(id: nil, business: nil, compliance: nil, contact: nil, created_at: nil, csp_id: nil, identity_status: nil, is_inherited: nil, status: nil, submitted_at: nil, submitted_to_tcr: nil, tcr_brand_id: nil, universal_ein: nil, updated_at: nil)
      #   Brand response with nested contact, business, and compliance sections — mirrors
      #   the request structure.
      #
      #   @param id [String] Unique identifier for the brand
      #
      #   @param business [Sentdm::Models::BrandWithKYC::Business, nil] Business details and address information
      #
      #   @param compliance [Sentdm::Models::BrandWithKYC::Compliance, nil] Compliance and TCR-related information
      #
      #   @param contact [Sentdm::Models::BrandWithKYC::Contact, nil] Contact information for the brand
      #
      #   @param created_at [Time] When the brand was created
      #
      #   @param csp_id [String, nil] CSP (Campaign Service Provider) ID
      #
      #   @param identity_status [Symbol, Sentdm::Models::BrandWithKYC::IdentityStatus, nil] TCR brand identity verification status
      #
      #   @param is_inherited [Boolean] Whether this brand is inherited from the parent organization
      #
      #   @param status [Symbol, Sentdm::Models::BrandWithKYC::Status, nil] TCR brand status
      #
      #   @param submitted_at [Time, nil] When the brand was submitted to TCR
      #
      #   @param submitted_to_tcr [Boolean] Whether this brand has been submitted to TCR
      #
      #   @param tcr_brand_id [String, nil] TCR brand ID (populated after TCR submission)
      #
      #   @param universal_ein [String, nil] Universal EIN from TCR
      #
      #   @param updated_at [Time, nil] When the brand was last updated

      # @see Sentdm::Models::BrandWithKYC#business
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
        optional :country_of_registration, String, nil?: true

        # @!attribute entity_type
        #   Business entity type
        #
        #   @return [String, nil]
        optional :entity_type, String, nil?: true

        # @!attribute legal_name
        #   Legal business name
        #
        #   @return [String, nil]
        optional :legal_name, String, nil?: true

        # @!attribute postal_code
        #   Postal/ZIP code
        #
        #   @return [String, nil]
        optional :postal_code, String, nil?: true

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
        optional :tax_id, String, nil?: true

        # @!attribute tax_id_type
        #   Type of tax ID (e.g., us_ein, ca_bn)
        #
        #   @return [String, nil]
        optional :tax_id_type, String, nil?: true

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
        #   @param entity_type [String, nil] Business entity type
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
      end

      # @see Sentdm::Models::BrandWithKYC#compliance
      class Compliance < Sentdm::Internal::Type::BaseModel
        # @!attribute brand_relationship
        #   Brand relationship level with TCR
        #
        #   @return [Symbol, Sentdm::Models::TcrBrandRelationship, nil]
        optional :brand_relationship, enum: -> { Sentdm::TcrBrandRelationship }, nil?: true

        # @!attribute destination_countries
        #   List of destination countries for messaging
        #
        #   @return [Array<Sentdm::Models::DestinationCountry>, nil]
        optional :destination_countries, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::DestinationCountry] }

        # @!attribute expected_messaging_volume
        #   Expected daily messaging volume
        #
        #   @return [String, nil]
        optional :expected_messaging_volume, String, nil?: true

        # @!attribute is_tcr_application
        #   Whether this is a TCR (Campaign Registry) application
        #
        #   @return [Boolean, nil]
        optional :is_tcr_application, Sentdm::Internal::Type::Boolean

        # @!attribute notes
        #   Additional notes about the business or use case
        #
        #   @return [String, nil]
        optional :notes, String, nil?: true

        # @!attribute phone_number_prefix
        #   Phone number prefix for messaging (e.g., "+1")
        #
        #   @return [String, nil]
        optional :phone_number_prefix, String, nil?: true

        # @!attribute primary_use_case
        #   Primary messaging use case description
        #
        #   @return [String, nil]
        optional :primary_use_case, String, nil?: true

        # @!attribute vertical
        #   Business vertical/industry category
        #
        #   @return [Symbol, Sentdm::Models::TcrVertical, nil]
        optional :vertical, enum: -> { Sentdm::TcrVertical }, nil?: true

        # @!method initialize(brand_relationship: nil, destination_countries: nil, expected_messaging_volume: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil, primary_use_case: nil, vertical: nil)
        #   Compliance and TCR-related information
        #
        #   @param brand_relationship [Symbol, Sentdm::Models::TcrBrandRelationship, nil] Brand relationship level with TCR
        #
        #   @param destination_countries [Array<Sentdm::Models::DestinationCountry>] List of destination countries for messaging
        #
        #   @param expected_messaging_volume [String, nil] Expected daily messaging volume
        #
        #   @param is_tcr_application [Boolean] Whether this is a TCR (Campaign Registry) application
        #
        #   @param notes [String, nil] Additional notes about the business or use case
        #
        #   @param phone_number_prefix [String, nil] Phone number prefix for messaging (e.g., "+1")
        #
        #   @param primary_use_case [String, nil] Primary messaging use case description
        #
        #   @param vertical [Symbol, Sentdm::Models::TcrVertical, nil] Business vertical/industry category
      end

      # @see Sentdm::Models::BrandWithKYC#contact
      class Contact < Sentdm::Internal::Type::BaseModel
        # @!attribute business_name
        #   Business/brand name
        #
        #   @return [String, nil]
        optional :business_name, String, nil?: true

        # @!attribute email
        #   Contact email address
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!attribute name
        #   Primary contact name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute phone
        #   Contact phone number in E.164 format
        #
        #   @return [String, nil]
        optional :phone, String, nil?: true

        # @!attribute phone_country_code
        #   Contact phone country code (e.g., "1" for US)
        #
        #   @return [String, nil]
        optional :phone_country_code, String, nil?: true

        # @!attribute role
        #   Contact's role in the business
        #
        #   @return [String, nil]
        optional :role, String, nil?: true

        # @!method initialize(business_name: nil, email: nil, name: nil, phone: nil, phone_country_code: nil, role: nil)
        #   Contact information for the brand
        #
        #   @param business_name [String, nil] Business/brand name
        #
        #   @param email [String, nil] Contact email address
        #
        #   @param name [String] Primary contact name
        #
        #   @param phone [String, nil] Contact phone number in E.164 format
        #
        #   @param phone_country_code [String, nil] Contact phone country code (e.g., "1" for US)
        #
        #   @param role [String, nil] Contact's role in the business
      end

      # TCR brand identity verification status
      #
      # @see Sentdm::Models::BrandWithKYC#identity_status
      module IdentityStatus
        extend Sentdm::Internal::Type::Enum

        SELF_DECLARED = :SELF_DECLARED
        UNVERIFIED = :UNVERIFIED
        VERIFIED = :VERIFIED
        VETTED_VERIFIED = :VETTED_VERIFIED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # TCR brand status
      #
      # @see Sentdm::Models::BrandWithKYC#status
      module Status
        extend Sentdm::Internal::Type::Enum

        ACTIVE = :ACTIVE
        INACTIVE = :INACTIVE
        SUSPENDED = :SUSPENDED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
