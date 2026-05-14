# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#create
    class ProfileCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute allow_contact_sharing
      #   Whether contacts are shared across profiles (default: false)
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean

      # @!attribute allow_template_sharing
      #   Whether templates are shared across profiles (default: false)
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, Sentdm::Internal::Type::Boolean

      # @!attribute billing_contact
      #   Billing contact information for a profile. Required when billing_model is
      #   "profile" or "profile_and_organization".
      #
      #   @return [Sentdm::Models::ProfileCreateParams::BillingContact, nil]
      optional :billing_contact, -> { Sentdm::ProfileCreateParams::BillingContact }, nil?: true

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization (default:
      #   profile).
      #
      #   - "organization": the organization's billing details are used; no profile-level
      #     billing info needed.
      #   - "profile": the profile is billed independently; billing_contact is required.
      #   - "profile_and_organization": the profile is billed first with the organization
      #     as fallback; billing_contact is required.
      #
      #   @return [String, nil]
      optional :billing_model, String, nil?: true

      # @!attribute brand
      #   Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @return [Sentdm::Models::ProfileCreateParams::Brand, nil]
      optional :brand, -> { Sentdm::ProfileCreateParams::Brand }, nil?: true

      # @!attribute description
      #   Profile description (optional)
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute icon
      #   Profile icon URL (optional)
      #
      #   @return [String, nil]
      optional :icon, String, nil?: true

      # @!attribute inherit_contacts
      #   Whether this profile inherits contacts from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_templates
      #   Whether this profile inherits templates from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute name
      #   Profile name (required)
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute payment_details
      #   Payment card details for a profile. Accepted when billing_model is "profile" or
      #   "profile_and_organization". These details are not stored on our servers and will
      #   be forwarded to the payment processor.
      #
      #   @return [Sentdm::Models::ProfileCreateParams::PaymentDetails, nil]
      optional :payment_details, -> { Sentdm::ProfileCreateParams::PaymentDetails }, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute short_name
      #   Profile short name/abbreviation (optional). Must be 3–11 characters, contain
      #   only letters, numbers, and spaces, and include at least one letter. Example:
      #   "SALES", "Mkt 2", "Support1".
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute whatsapp_business_account
      #   Direct WhatsApp Business Account credentials for a profile. Use this when the
      #   profile should have its own WhatsApp Business Account instead of inheriting from
      #   the organization. Credentials must be obtained from Meta Business Manager by
      #   creating a System User with whatsapp_business_messaging and
      #   whatsapp_business_management scopes.
      #
      #   @return [Sentdm::Models::ProfileCreateParams::WhatsappBusinessAccount, nil]
      optional :whatsapp_business_account,
               -> { Sentdm::ProfileCreateParams::WhatsappBusinessAccount },
               nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(allow_contact_sharing: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, payment_details: nil, sandbox: nil, short_name: nil, whatsapp_business_account: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileCreateParams} for more details.
      #
      #   @param allow_contact_sharing [Boolean] Whether contacts are shared across profiles (default: false)
      #
      #   @param allow_template_sharing [Boolean] Whether templates are shared across profiles (default: false)
      #
      #   @param billing_contact [Sentdm::Models::ProfileCreateParams::BillingContact, nil] Billing contact information for a profile.
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (default: prof
      #
      #   @param brand [Sentdm::Models::ProfileCreateParams::Brand, nil] Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @param description [String, nil] Profile description (optional)
      #
      #   @param icon [String, nil] Profile icon URL (optional)
      #
      #   @param inherit_contacts [Boolean, nil] Whether this profile inherits contacts from organization (default: true)
      #
      #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from organization (default: true)
      #
      #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from organization (default: true)
      #
      #   @param inherit_templates [Boolean, nil] Whether this profile inherits templates from organization (default: true)
      #
      #   @param name [String] Profile name (required)
      #
      #   @param payment_details [Sentdm::Models::ProfileCreateParams::PaymentDetails, nil] Payment card details for a profile.
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param short_name [String, nil] Profile short name/abbreviation (optional). Must be 3–11 characters, contain onl
      #
      #   @param whatsapp_business_account [Sentdm::Models::ProfileCreateParams::WhatsappBusinessAccount, nil] Direct WhatsApp Business Account credentials for a profile.
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class BillingContact < Sentdm::Internal::Type::BaseModel
        # @!attribute email
        #   Email address where invoices will be sent (required)
        #
        #   @return [String]
        required :email, String

        # @!attribute name
        #   Full name of the billing contact or company (required)
        #
        #   @return [String]
        required :name, String

        # @!attribute address
        #   Billing address (optional). Free-form text including street, city, state, postal
        #   code, and country.
        #
        #   @return [String, nil]
        optional :address, String, nil?: true

        # @!attribute phone
        #   Phone number for the billing contact (optional)
        #
        #   @return [String, nil]
        optional :phone, String, nil?: true

        # @!method initialize(email:, name:, address: nil, phone: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::ProfileCreateParams::BillingContact} for more details.
        #
        #   Billing contact information for a profile. Required when billing_model is
        #   "profile" or "profile_and_organization".
        #
        #   @param email [String] Email address where invoices will be sent (required)
        #
        #   @param name [String] Full name of the billing contact or company (required)
        #
        #   @param address [String, nil] Billing address (optional). Free-form text including street, city, state, postal
        #
        #   @param phone [String, nil] Phone number for the billing contact (optional)
      end

      class Brand < Sentdm::Internal::Type::BaseModel
        # @!attribute compliance
        #   Compliance and TCR information for brand registration
        #
        #   @return [Sentdm::Models::ProfileCreateParams::Brand::Compliance]
        required :compliance, -> { Sentdm::ProfileCreateParams::Brand::Compliance }

        # @!attribute contact
        #   Contact information for brand KYC
        #
        #   @return [Sentdm::Models::ProfileCreateParams::Brand::Contact]
        required :contact, -> { Sentdm::ProfileCreateParams::Brand::Contact }

        # @!attribute business
        #   Business details and address for brand KYC
        #
        #   @return [Sentdm::Models::ProfileCreateParams::Brand::Business, nil]
        optional :business, -> { Sentdm::ProfileCreateParams::Brand::Business }, nil?: true

        # @!method initialize(compliance:, contact:, business: nil)
        #   Brand and KYC data grouped into contact, business, and compliance sections
        #
        #   @param compliance [Sentdm::Models::ProfileCreateParams::Brand::Compliance] Compliance and TCR information for brand registration
        #
        #   @param contact [Sentdm::Models::ProfileCreateParams::Brand::Contact] Contact information for brand KYC
        #
        #   @param business [Sentdm::Models::ProfileCreateParams::Brand::Business, nil] Business details and address for brand KYC

        # @see Sentdm::Models::ProfileCreateParams::Brand#compliance
        class Compliance < Sentdm::Internal::Type::BaseModel
          # @!attribute brand_relationship
          #
          #   @return [Symbol, Sentdm::Models::ProfileCreateParams::Brand::Compliance::BrandRelationship]
          required :brand_relationship,
                   enum: -> { Sentdm::ProfileCreateParams::Brand::Compliance::BrandRelationship },
                   api_name: :brandRelationship

          # @!attribute vertical
          #
          #   @return [Symbol, Sentdm::Models::ProfileCreateParams::Brand::Compliance::Vertical]
          required :vertical, enum: -> { Sentdm::ProfileCreateParams::Brand::Compliance::Vertical }

          # @!attribute destination_countries
          #   List of destination countries for messaging
          #
          #   @return [Array<Sentdm::Models::ProfileCreateParams::Brand::Compliance::DestinationCountry>, nil]
          optional :destination_countries,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::ProfileCreateParams::Brand::Compliance::DestinationCountry]
                   },
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
          optional :is_tcr_application,
                   Sentdm::Internal::Type::Boolean,
                   api_name: :isTcrApplication,
                   nil?: true

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
          #   @param brand_relationship [Symbol, Sentdm::Models::ProfileCreateParams::Brand::Compliance::BrandRelationship]
          #
          #   @param vertical [Symbol, Sentdm::Models::ProfileCreateParams::Brand::Compliance::Vertical]
          #
          #   @param destination_countries [Array<Sentdm::Models::ProfileCreateParams::Brand::Compliance::DestinationCountry>, nil] List of destination countries for messaging
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

          # @see Sentdm::Models::ProfileCreateParams::Brand::Compliance#brand_relationship
          module BrandRelationship
            extend Sentdm::Internal::Type::Enum

            BASIC_ACCOUNT = :BASIC_ACCOUNT
            MEDIUM_ACCOUNT = :MEDIUM_ACCOUNT
            LARGE_ACCOUNT = :LARGE_ACCOUNT
            SMALL_ACCOUNT = :SMALL_ACCOUNT
            KEY_ACCOUNT = :KEY_ACCOUNT

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Sentdm::Models::ProfileCreateParams::Brand::Compliance#vertical
          module Vertical
            extend Sentdm::Internal::Type::Enum

            PROFESSIONAL = :PROFESSIONAL
            REAL_ESTATE = :REAL_ESTATE
            HEALTHCARE = :HEALTHCARE
            HUMAN_RESOURCES = :HUMAN_RESOURCES
            ENERGY = :ENERGY
            ENTERTAINMENT = :ENTERTAINMENT
            RETAIL = :RETAIL
            TRANSPORTATION = :TRANSPORTATION
            AGRICULTURE = :AGRICULTURE
            INSURANCE = :INSURANCE
            POSTAL = :POSTAL
            EDUCATION = :EDUCATION
            HOSPITALITY = :HOSPITALITY
            FINANCIAL = :FINANCIAL
            POLITICAL = :POLITICAL
            GAMBLING = :GAMBLING
            LEGAL = :LEGAL
            CONSTRUCTION = :CONSTRUCTION
            NGO = :NGO
            MANUFACTURING = :MANUFACTURING
            GOVERNMENT = :GOVERNMENT
            TECHNOLOGY = :TECHNOLOGY
            COMMUNICATION = :COMMUNICATION

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class DestinationCountry < Sentdm::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute is_main
            #
            #   @return [Boolean, nil]
            optional :is_main, Sentdm::Internal::Type::Boolean, api_name: :isMain

            # @!method initialize(id: nil, is_main: nil)
            #   @param id [String]
            #   @param is_main [Boolean]
          end
        end

        # @see Sentdm::Models::ProfileCreateParams::Brand#contact
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

        # @see Sentdm::Models::ProfileCreateParams::Brand#business
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
          #
          #   @return [Symbol, Sentdm::Models::ProfileCreateParams::Brand::Business::EntityType, nil]
          optional :entity_type,
                   enum: -> { Sentdm::ProfileCreateParams::Brand::Business::EntityType },
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
          #   Business details and address for brand KYC
          #
          #   @param city [String, nil] City
          #
          #   @param country [String, nil] Country code (e.g., US, CA)
          #
          #   @param country_of_registration [String, nil] Country where the business is registered
          #
          #   @param entity_type [Symbol, Sentdm::Models::ProfileCreateParams::Brand::Business::EntityType, nil]
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

          # @see Sentdm::Models::ProfileCreateParams::Brand::Business#entity_type
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

      class PaymentDetails < Sentdm::Internal::Type::BaseModel
        # @!attribute card_number
        #   Card number (digits only, 13–19 characters)
        #
        #   @return [String]
        required :card_number, String

        # @!attribute cvc
        #   Card security code (3–4 digits)
        #
        #   @return [String]
        required :cvc, String

        # @!attribute expiry
        #   Card expiry date in MM/YY format (e.g. "09/27")
        #
        #   @return [String]
        required :expiry, String

        # @!attribute zip_code
        #   Billing ZIP / postal code associated with the card
        #
        #   @return [String]
        required :zip_code, String

        # @!method initialize(card_number:, cvc:, expiry:, zip_code:)
        #   Payment card details for a profile. Accepted when billing_model is "profile" or
        #   "profile_and_organization". These details are not stored on our servers and will
        #   be forwarded to the payment processor.
        #
        #   @param card_number [String] Card number (digits only, 13–19 characters)
        #
        #   @param cvc [String] Card security code (3–4 digits)
        #
        #   @param expiry [String] Card expiry date in MM/YY format (e.g. "09/27")
        #
        #   @param zip_code [String] Billing ZIP / postal code associated with the card
      end

      class WhatsappBusinessAccount < Sentdm::Internal::Type::BaseModel
        # @!attribute access_token
        #   System User access token with whatsapp_business_messaging and
        #   whatsapp_business_management permissions. This value is stored securely and
        #   never returned in API responses.
        #
        #   @return [String]
        required :access_token, String

        # @!attribute waba_id
        #   WhatsApp Business Account ID from Meta Business Manager
        #
        #   @return [String]
        required :waba_id, String

        # @!attribute phone_number_id
        #   Phone Number ID of an existing number already registered under this WABA in Meta
        #   Business Manager. Optional — when omitted, a number will be provisioned from our
        #   pool and registered in the WABA during the onboarding flow. When provided, the
        #   number must already exist in the WABA.
        #
        #   @return [String, nil]
        optional :phone_number_id, String, nil?: true

        # @!method initialize(access_token:, waba_id:, phone_number_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::ProfileCreateParams::WhatsappBusinessAccount} for more details.
        #
        #   Direct WhatsApp Business Account credentials for a profile. Use this when the
        #   profile should have its own WhatsApp Business Account instead of inheriting from
        #   the organization. Credentials must be obtained from Meta Business Manager by
        #   creating a System User with whatsapp_business_messaging and
        #   whatsapp_business_management scopes.
        #
        #   @param access_token [String] System User access token with whatsapp_business_messaging and
        #
        #   @param waba_id [String] WhatsApp Business Account ID from Meta Business Manager
        #
        #   @param phone_number_id [String, nil] Phone Number ID of an existing number already registered under this WABA in Meta
      end
    end
  end
end
