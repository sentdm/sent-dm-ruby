# frozen_string_literal: true

module SentDm
  module Models
    class BrandWithKYC < SentDm::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the brand
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute brand_relationship
      #   Brand relationship level with TCR
      #
      #   @return [Symbol, SentDm::Models::TcrBrandRelationship, nil]
      optional :brand_relationship,
               enum: -> { SentDm::TcrBrandRelationship },
               api_name: :brandRelationship,
               nil?: true

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

      # @!attribute contact_name
      #   Primary contact name
      #
      #   @return [String, nil]
      optional :contact_name, String, api_name: :contactName

      # @!attribute contact_phone
      #   Contact phone number
      #
      #   @return [String, nil]
      optional :contact_phone, String, api_name: :contactPhone, nil?: true

      # @!attribute contact_phone_country_code
      #   Contact phone country code
      #
      #   @return [String, nil]
      optional :contact_phone_country_code, String, api_name: :contactPhoneCountryCode, nil?: true

      # @!attribute country
      #   Country code
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute country_of_registration
      #   Country where the business is registered
      #
      #   @return [String, nil]
      optional :country_of_registration, String, api_name: :countryOfRegistration, nil?: true

      # @!attribute created_at
      #   When the brand was created
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute csp_id
      #   CSP (Campaign Service Provider) ID
      #
      #   @return [String, nil]
      optional :csp_id, String, api_name: :cspId, nil?: true

      # @!attribute destination_countries
      #   List of destination countries for messaging
      #
      #   @return [Array<SentDm::Models::DestinationCountry>, nil]
      optional :destination_countries,
               -> { SentDm::Internal::Type::ArrayOf[SentDm::DestinationCountry] },
               api_name: :destinationCountries

      # @!attribute entity_type
      #   Business entity type
      #
      #   @return [String, nil]
      optional :entity_type, String, api_name: :entityType, nil?: true

      # @!attribute expected_messaging_volume
      #   Expected daily messaging volume
      #
      #   @return [String, nil]
      optional :expected_messaging_volume, String, api_name: :expectedMessagingVolume, nil?: true

      # @!attribute identity_status
      #   TCR brand identity verification status
      #
      #   @return [Symbol, SentDm::Models::BrandWithKYC::IdentityStatus, nil]
      optional :identity_status,
               enum: -> { SentDm::BrandWithKYC::IdentityStatus },
               api_name: :identityStatus,
               nil?: true

      # @!attribute is_inherited
      #   Whether this brand is inherited from parent organization
      #
      #   @return [Boolean, nil]
      optional :is_inherited, SentDm::Internal::Type::Boolean, api_name: :isInherited

      # @!attribute is_tcr_application
      #   Whether this is a TCR application
      #
      #   @return [Boolean, nil]
      optional :is_tcr_application, SentDm::Internal::Type::Boolean, api_name: :isTcrApplication

      # @!attribute notes
      #   Additional notes
      #
      #   @return [String, nil]
      optional :notes, String, nil?: true

      # @!attribute phone_number_prefix
      #   Phone number prefix for messaging
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

      # @!attribute status
      #   TCR brand status
      #
      #   @return [Symbol, SentDm::Models::BrandWithKYC::Status, nil]
      optional :status, enum: -> { SentDm::BrandWithKYC::Status }, nil?: true

      # @!attribute street
      #   Street address
      #
      #   @return [String, nil]
      optional :street, String, nil?: true

      # @!attribute submitted_at
      #   When the brand was submitted to TCR
      #
      #   @return [Time, nil]
      optional :submitted_at, Time, api_name: :submittedAt, nil?: true

      # @!attribute submitted_to_tcr
      #   Whether this brand was submitted to TCR
      #
      #   @return [Boolean, nil]
      optional :submitted_to_tcr, SentDm::Internal::Type::Boolean, api_name: :submittedToTCR

      # @!attribute tax_id
      #   Tax ID/EIN number
      #
      #   @return [String, nil]
      optional :tax_id, String, api_name: :taxId, nil?: true

      # @!attribute tax_id_type
      #   Type of tax ID
      #
      #   @return [String, nil]
      optional :tax_id_type, String, api_name: :taxIdType, nil?: true

      # @!attribute tcr_brand_id
      #   TCR brand ID (populated after TCR submission)
      #
      #   @return [String, nil]
      optional :tcr_brand_id, String, api_name: :tcrBrandId, nil?: true

      # @!attribute universal_ein
      #   Universal EIN from TCR
      #
      #   @return [String, nil]
      optional :universal_ein, String, api_name: :universalEin, nil?: true

      # @!attribute updated_at
      #   When the brand was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt, nil?: true

      # @!attribute vertical
      #   Business vertical/industry category
      #
      #   @return [Symbol, SentDm::Models::TcrVertical, nil]
      optional :vertical, enum: -> { SentDm::TcrVertical }, nil?: true

      # @!method initialize(id: nil, brand_relationship: nil, business_legal_name: nil, business_name: nil, business_role: nil, business_url: nil, city: nil, contact_email: nil, contact_name: nil, contact_phone: nil, contact_phone_country_code: nil, country: nil, country_of_registration: nil, created_at: nil, csp_id: nil, destination_countries: nil, entity_type: nil, expected_messaging_volume: nil, identity_status: nil, is_inherited: nil, is_tcr_application: nil, notes: nil, phone_number_prefix: nil, postal_code: nil, primary_use_case: nil, state: nil, status: nil, street: nil, submitted_at: nil, submitted_to_tcr: nil, tax_id: nil, tax_id_type: nil, tcr_brand_id: nil, universal_ein: nil, updated_at: nil, vertical: nil)
      #   Flattened brand response with embedded KYC information
      #
      #   @param id [String] Unique identifier for the brand
      #
      #   @param brand_relationship [Symbol, SentDm::Models::TcrBrandRelationship, nil] Brand relationship level with TCR
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
      #   @param contact_name [String] Primary contact name
      #
      #   @param contact_phone [String, nil] Contact phone number
      #
      #   @param contact_phone_country_code [String, nil] Contact phone country code
      #
      #   @param country [String, nil] Country code
      #
      #   @param country_of_registration [String, nil] Country where the business is registered
      #
      #   @param created_at [Time] When the brand was created
      #
      #   @param csp_id [String, nil] CSP (Campaign Service Provider) ID
      #
      #   @param destination_countries [Array<SentDm::Models::DestinationCountry>] List of destination countries for messaging
      #
      #   @param entity_type [String, nil] Business entity type
      #
      #   @param expected_messaging_volume [String, nil] Expected daily messaging volume
      #
      #   @param identity_status [Symbol, SentDm::Models::BrandWithKYC::IdentityStatus, nil] TCR brand identity verification status
      #
      #   @param is_inherited [Boolean] Whether this brand is inherited from parent organization
      #
      #   @param is_tcr_application [Boolean] Whether this is a TCR application
      #
      #   @param notes [String, nil] Additional notes
      #
      #   @param phone_number_prefix [String, nil] Phone number prefix for messaging
      #
      #   @param postal_code [String, nil] Postal/ZIP code
      #
      #   @param primary_use_case [String, nil] Primary messaging use case description
      #
      #   @param state [String, nil] State/province code
      #
      #   @param status [Symbol, SentDm::Models::BrandWithKYC::Status, nil] TCR brand status
      #
      #   @param street [String, nil] Street address
      #
      #   @param submitted_at [Time, nil] When the brand was submitted to TCR
      #
      #   @param submitted_to_tcr [Boolean] Whether this brand was submitted to TCR
      #
      #   @param tax_id [String, nil] Tax ID/EIN number
      #
      #   @param tax_id_type [String, nil] Type of tax ID
      #
      #   @param tcr_brand_id [String, nil] TCR brand ID (populated after TCR submission)
      #
      #   @param universal_ein [String, nil] Universal EIN from TCR
      #
      #   @param updated_at [Time, nil] When the brand was last updated
      #
      #   @param vertical [Symbol, SentDm::Models::TcrVertical, nil] Business vertical/industry category

      # TCR brand identity verification status
      #
      # @see SentDm::Models::BrandWithKYC#identity_status
      module IdentityStatus
        extend SentDm::Internal::Type::Enum

        SELF_DECLARED = :SELF_DECLARED
        UNVERIFIED = :UNVERIFIED
        VERIFIED = :VERIFIED
        VETTED_VERIFIED = :VETTED_VERIFIED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # TCR brand status
      #
      # @see SentDm::Models::BrandWithKYC#status
      module Status
        extend SentDm::Internal::Type::Enum

        ACTIVE = :ACTIVE
        INACTIVE = :INACTIVE
        SUSPENDED = :SUSPENDED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
