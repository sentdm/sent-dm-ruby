# frozen_string_literal: true

module Sentdm
  module Models
    class ProfileDetail < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Profile unique identifier
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute allow_contact_sharing
      #   Whether contacts are shared across profiles in the organization
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean

      # @!attribute allow_number_change_during_onboarding
      #   Whether number changes are allowed during onboarding
      #
      #   @return [Boolean, nil]
      optional :allow_number_change_during_onboarding, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_template_sharing
      #   Whether templates are shared across profiles in the organization
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, Sentdm::Internal::Type::Boolean

      # @!attribute billing_contact
      #   Billing contact for this profile. Present when billing_model is "profile" or
      #   "profile_and_organization".
      #
      #   @return [Sentdm::Models::ProfileDetail::BillingContact, nil]
      optional :billing_contact, -> { Sentdm::ProfileDetail::BillingContact }, nil?: true

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization
      #
      #   @return [String, nil]
      optional :billing_model, String

      # @!attribute brand
      #   Brand associated with this profile. Null if no brand has been configured yet.
      #   Includes KYC information and TCR registration status.
      #
      #   @return [Sentdm::Models::BrandWithKYC, nil]
      optional :brand, -> { Sentdm::BrandWithKYC }, nil?: true

      # @!attribute created_at
      #   When the profile was created
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute description
      #   Profile description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute email
      #   Profile email (inherited from organization)
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute icon
      #   Profile icon URL
      #
      #   @return [String, nil]
      optional :icon, String, nil?: true

      # @!attribute inherit_contacts
      #   Whether this profile inherits contacts from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, Sentdm::Internal::Type::Boolean

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean

      # @!attribute inherit_templates
      #   Whether this profile inherits templates from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, Sentdm::Internal::Type::Boolean

      # @!attribute name
      #   Profile name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute organization_id
      #   Parent organization ID
      #
      #   @return [String, nil]
      optional :organization_id, String, nil?: true

      # @!attribute sending_phone_number
      #   Direct SMS phone number
      #
      #   @return [String, nil]
      optional :sending_phone_number, String, nil?: true

      # @!attribute sending_phone_number_profile_id
      #   Reference to another profile for SMS/Telnyx configuration
      #
      #   @return [String, nil]
      optional :sending_phone_number_profile_id, String, nil?: true

      # @!attribute sending_whatsapp_number_profile_id
      #   Reference to another profile for WhatsApp configuration
      #
      #   @return [String, nil]
      optional :sending_whatsapp_number_profile_id, String, nil?: true

      # @!attribute short_name
      #   Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces
      #   only, with at least one letter.
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute status
      #   Profile setup status: incomplete, pending_review, approved, rejected
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute updated_at
      #   When the profile was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!attribute waba_id
      #   WhatsApp Business Account ID associated with this profile. Present whether the
      #   WABA is inherited from the organization or configured directly.
      #
      #   @return [String, nil]
      optional :waba_id, String, nil?: true

      # @!attribute whatsapp_phone_number
      #   Direct WhatsApp phone number
      #
      #   @return [String, nil]
      optional :whatsapp_phone_number, String, nil?: true

      # @!method initialize(id: nil, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, created_at: nil, description: nil, email: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, organization_id: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, status: nil, updated_at: nil, waba_id: nil, whatsapp_phone_number: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileDetail} for more details.
      #
      #   Detailed profile response for v3 API
      #
      #   @param id [String] Profile unique identifier
      #
      #   @param allow_contact_sharing [Boolean] Whether contacts are shared across profiles in the organization
      #
      #   @param allow_number_change_during_onboarding [Boolean, nil] Whether number changes are allowed during onboarding
      #
      #   @param allow_template_sharing [Boolean] Whether templates are shared across profiles in the organization
      #
      #   @param billing_contact [Sentdm::Models::ProfileDetail::BillingContact, nil] Billing contact for this profile. Present when billing_model is "profile" or "pr
      #
      #   @param billing_model [String] Billing model: profile, organization, or profile_and_organization
      #
      #   @param brand [Sentdm::Models::BrandWithKYC, nil] Brand associated with this profile. Null if no brand has been configured yet.
      #
      #   @param created_at [Time] When the profile was created
      #
      #   @param description [String, nil] Profile description
      #
      #   @param email [String, nil] Profile email (inherited from organization)
      #
      #   @param icon [String, nil] Profile icon URL
      #
      #   @param inherit_contacts [Boolean] Whether this profile inherits contacts from the organization
      #
      #   @param inherit_tcr_brand [Boolean] Whether this profile inherits TCR brand from the organization
      #
      #   @param inherit_tcr_campaign [Boolean] Whether this profile inherits TCR campaign from the organization
      #
      #   @param inherit_templates [Boolean] Whether this profile inherits templates from the organization
      #
      #   @param name [String] Profile name
      #
      #   @param organization_id [String, nil] Parent organization ID
      #
      #   @param sending_phone_number [String, nil] Direct SMS phone number
      #
      #   @param sending_phone_number_profile_id [String, nil] Reference to another profile for SMS/Telnyx configuration
      #
      #   @param sending_whatsapp_number_profile_id [String, nil] Reference to another profile for WhatsApp configuration
      #
      #   @param short_name [String, nil] Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces o
      #
      #   @param status [String] Profile setup status: incomplete, pending_review, approved, rejected
      #
      #   @param updated_at [Time, nil] When the profile was last updated
      #
      #   @param waba_id [String, nil] WhatsApp Business Account ID associated with this profile.
      #
      #   @param whatsapp_phone_number [String, nil] Direct WhatsApp phone number

      # @see Sentdm::Models::ProfileDetail#billing_contact
      class BillingContact < Sentdm::Internal::Type::BaseModel
        # @!attribute address
        #
        #   @return [String, nil]
        optional :address, String, nil?: true

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute phone
        #
        #   @return [String, nil]
        optional :phone, String, nil?: true

        # @!method initialize(address: nil, email: nil, name: nil, phone: nil)
        #   Billing contact for this profile. Present when billing_model is "profile" or
        #   "profile_and_organization".
        #
        #   @param address [String, nil]
        #   @param email [String, nil]
        #   @param name [String, nil]
        #   @param phone [String, nil]
      end
    end
  end
end
