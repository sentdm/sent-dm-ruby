# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#update
    class ProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!attribute allow_contact_sharing
      #   Whether contacts are shared across profiles (optional)
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_number_change_during_onboarding
      #   Whether number changes are allowed during onboarding (optional)
      #
      #   @return [Boolean, nil]
      optional :allow_number_change_during_onboarding, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_template_sharing
      #   Whether templates are shared across profiles (optional)
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute billing_contact
      #   Billing contact for this profile. Required when billing_model is "profile" or
      #   "profile_and_organization" and no billing contact has been configured yet.
      #   Identifies who receives invoices and who is responsible for payment.
      #
      #   @return [Sentdm::Models::ProfileUpdateParams::BillingContact, nil]
      optional :billing_contact, -> { Sentdm::ProfileUpdateParams::BillingContact }, nil?: true

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization (optional).
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
      #   Brand and KYC information for this profile (optional). When provided, creates or
      #   updates the brand associated with this profile. Cannot be set when
      #   inherit_tcr_brand is true. Once a brand has been submitted to TCR it cannot be
      #   modified.
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
      #   Whether this profile inherits contacts from organization (optional)
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from organization (optional)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from organization (optional)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_templates
      #   Whether this profile inherits templates from organization (optional)
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute name
      #   Profile name (optional)
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute payment_details
      #   Payment card details for this profile (optional). Accepted when billing_model is
      #   "profile" or "profile_and_organization". Not persisted on our servers —
      #   forwarded to the payment processor.
      #
      #   @return [Sentdm::Models::ProfileUpdateParams::PaymentDetails, nil]
      optional :payment_details, -> { Sentdm::ProfileUpdateParams::PaymentDetails }, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute sending_phone_number
      #   Direct phone number for SMS sending (optional)
      #
      #   @return [String, nil]
      optional :sending_phone_number, String, nil?: true

      # @!attribute sending_phone_number_profile_id
      #   Reference to another profile to use for SMS/Telnyx configuration (optional)
      #
      #   @return [String, nil]
      optional :sending_phone_number_profile_id, String, nil?: true

      # @!attribute sending_whatsapp_number_profile_id
      #   Reference to another profile to use for WhatsApp configuration (optional)
      #
      #   @return [String, nil]
      optional :sending_whatsapp_number_profile_id, String, nil?: true

      # @!attribute short_name
      #   Profile short name/abbreviation (optional). Must be 3–11 characters, contain
      #   only letters, numbers, and spaces, and include at least one letter. Example:
      #   "SALES", "Mkt 2", "Support1".
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute whatsapp_phone_number
      #   Direct phone number for WhatsApp sending (optional)
      #
      #   @return [String, nil]
      optional :whatsapp_phone_number, String, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(profile_id:, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, payment_details: nil, sandbox: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, whatsapp_phone_number: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileUpdateParams} for more details.
      #
      #   @param profile_id [String]
      #
      #   @param allow_contact_sharing [Boolean, nil] Whether contacts are shared across profiles (optional)
      #
      #   @param allow_number_change_during_onboarding [Boolean, nil] Whether number changes are allowed during onboarding (optional)
      #
      #   @param allow_template_sharing [Boolean, nil] Whether templates are shared across profiles (optional)
      #
      #   @param billing_contact [Sentdm::Models::ProfileUpdateParams::BillingContact, nil] Billing contact for this profile. Required when billing_model is "profile" or "p
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (optional).
      #
      #   @param brand [Sentdm::Models::BrandData, nil] Brand and KYC information for this profile (optional).
      #
      #   @param description [String, nil] Profile description (optional)
      #
      #   @param icon [String, nil] Profile icon URL (optional)
      #
      #   @param inherit_contacts [Boolean, nil] Whether this profile inherits contacts from organization (optional)
      #
      #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from organization (optional)
      #
      #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from organization (optional)
      #
      #   @param inherit_templates [Boolean, nil] Whether this profile inherits templates from organization (optional)
      #
      #   @param name [String, nil] Profile name (optional)
      #
      #   @param payment_details [Sentdm::Models::ProfileUpdateParams::PaymentDetails, nil] Payment card details for this profile (optional).
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param sending_phone_number [String, nil] Direct phone number for SMS sending (optional)
      #
      #   @param sending_phone_number_profile_id [String, nil] Reference to another profile to use for SMS/Telnyx configuration (optional)
      #
      #   @param sending_whatsapp_number_profile_id [String, nil] Reference to another profile to use for WhatsApp configuration (optional)
      #
      #   @param short_name [String, nil] Profile short name/abbreviation (optional). Must be 3–11 characters, contain onl
      #
      #   @param whatsapp_phone_number [String, nil] Direct phone number for WhatsApp sending (optional)
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
        #   {Sentdm::Models::ProfileUpdateParams::BillingContact} for more details.
        #
        #   Billing contact for this profile. Required when billing_model is "profile" or
        #   "profile_and_organization" and no billing contact has been configured yet.
        #   Identifies who receives invoices and who is responsible for payment.
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
    end
  end
end
