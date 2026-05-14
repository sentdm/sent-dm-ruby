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
      #   @return [Sentdm::Models::BillingContactInfo, nil]
      optional :billing_contact, -> { Sentdm::BillingContactInfo }, nil?: true

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
      #   @return [Sentdm::Models::BrandsBrandData, nil]
      optional :brand, -> { Sentdm::BrandsBrandData }, nil?: true

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
      #   @return [Sentdm::Models::PaymentDetails, nil]
      optional :payment_details, -> { Sentdm::PaymentDetails }, nil?: true

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
      #   @param billing_contact [Sentdm::Models::BillingContactInfo, nil] Billing contact information for a profile.
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (default: prof
      #
      #   @param brand [Sentdm::Models::BrandsBrandData, nil] Brand and KYC data grouped into contact, business, and compliance sections
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
      #   @param payment_details [Sentdm::Models::PaymentDetails, nil] Payment card details for a profile.
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
