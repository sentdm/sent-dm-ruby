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
      #   Billing contact for this profile. Required when billing_model is "profile" or
      #   "profile_and_organization". Identifies who receives invoices and who is
      #   responsible for payment.
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
      #   Brand and KYC information for this profile (optional). When provided, creates
      #   the brand associated with this profile. Cannot be set when inherit_tcr_brand is
      #   true.
      #
      #   @return [Sentdm::Models::BrandData, nil]
      optional :brand, -> { Sentdm::BrandData }, nil?: true

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
      #   Payment card details for this profile (optional). Accepted when billing_model is
      #   "profile" or "profile_and_organization". Not persisted on our servers —
      #   forwarded to the payment processor.
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
      #   Direct WhatsApp Business Account credentials for this profile. When provided,
      #   the profile uses its own WhatsApp Business Account instead of inheriting from
      #   the organization. When omitted, the profile inherits the organization's WhatsApp
      #   Business Account (requires the organization to have completed WhatsApp Embedded
      #   Signup).
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
      #   @param billing_contact [Sentdm::Models::ProfileCreateParams::BillingContact, nil] Billing contact for this profile. Required when billing_model is "profile" or "p
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (default: prof
      #
      #   @param brand [Sentdm::Models::BrandData, nil] Brand and KYC information for this profile (optional).
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
      #   @param payment_details [Sentdm::Models::ProfileCreateParams::PaymentDetails, nil] Payment card details for this profile (optional).
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param short_name [String, nil] Profile short name/abbreviation (optional). Must be 3–11 characters, contain onl
      #
      #   @param whatsapp_business_account [Sentdm::Models::ProfileCreateParams::WhatsappBusinessAccount, nil] Direct WhatsApp Business Account credentials for this profile.
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
        #   Billing contact for this profile. Required when billing_model is "profile" or
        #   "profile_and_organization". Identifies who receives invoices and who is
        #   responsible for payment.
        #
        #   @param email [String] Email address where invoices will be sent (required)
        #
        #   @param name [String] Full name of the billing contact or company (required)
        #
        #   @param address [String, nil] Billing address (optional). Free-form text including street, city, state, postal
        #
        #   @param phone [String, nil] Phone number for the billing contact (optional)
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
        #   Payment card details for this profile (optional). Accepted when billing_model is
        #   "profile" or "profile_and_organization". Not persisted on our servers —
        #   forwarded to the payment processor.
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
        #   Direct WhatsApp Business Account credentials for this profile. When provided,
        #   the profile uses its own WhatsApp Business Account instead of inheriting from
        #   the organization. When omitted, the profile inherits the organization's WhatsApp
        #   Business Account (requires the organization to have completed WhatsApp Embedded
        #   Signup).
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
