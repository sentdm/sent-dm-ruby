# frozen_string_literal: true

module Sentdm
  module Models
    class ProfileDetail < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Profile unique identifier
      #
      #   @return [String, nil]
      optional :id, String

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

      # @!attribute settings
      #   Profile configuration settings
      #
      #   @return [Sentdm::Models::ProfileDetail::Settings, nil]
      optional :settings, -> { Sentdm::ProfileDetail::Settings }

      # @!attribute short_name
      #   Profile short name (abbreviation)
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

      # @!method initialize(id: nil, created_at: nil, description: nil, email: nil, icon: nil, name: nil, organization_id: nil, settings: nil, short_name: nil, status: nil, updated_at: nil)
      #   Detailed profile response for v3 API
      #
      #   @param id [String] Profile unique identifier
      #
      #   @param created_at [Time] When the profile was created
      #
      #   @param description [String, nil] Profile description
      #
      #   @param email [String, nil] Profile email (inherited from organization)
      #
      #   @param icon [String, nil] Profile icon URL
      #
      #   @param name [String] Profile name
      #
      #   @param organization_id [String, nil] Parent organization ID
      #
      #   @param settings [Sentdm::Models::ProfileDetail::Settings] Profile configuration settings
      #
      #   @param short_name [String, nil] Profile short name (abbreviation)
      #
      #   @param status [String] Profile setup status: incomplete, pending_review, approved, rejected
      #
      #   @param updated_at [Time, nil] When the profile was last updated

      # @see Sentdm::Models::ProfileDetail#settings
      class Settings < Sentdm::Internal::Type::BaseModel
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

        # @!attribute billing_model
        #   Billing model: profile, organization, or profile_and_organization
        #
        #   @return [String, nil]
        optional :billing_model, String

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

        # @!attribute whatsapp_phone_number
        #   Direct WhatsApp phone number
        #
        #   @return [String, nil]
        optional :whatsapp_phone_number, String, nil?: true

        # @!method initialize(allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_model: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, whatsapp_phone_number: nil)
        #   Profile configuration settings
        #
        #   @param allow_contact_sharing [Boolean] Whether contacts are shared across profiles in the organization
        #
        #   @param allow_number_change_during_onboarding [Boolean, nil] Whether number changes are allowed during onboarding
        #
        #   @param allow_template_sharing [Boolean] Whether templates are shared across profiles in the organization
        #
        #   @param billing_model [String] Billing model: profile, organization, or profile_and_organization
        #
        #   @param inherit_contacts [Boolean] Whether this profile inherits contacts from the organization
        #
        #   @param inherit_tcr_brand [Boolean] Whether this profile inherits TCR brand from the organization
        #
        #   @param inherit_tcr_campaign [Boolean] Whether this profile inherits TCR campaign from the organization
        #
        #   @param inherit_templates [Boolean] Whether this profile inherits templates from the organization
        #
        #   @param sending_phone_number [String, nil] Direct SMS phone number
        #
        #   @param sending_phone_number_profile_id [String, nil] Reference to another profile for SMS/Telnyx configuration
        #
        #   @param sending_whatsapp_number_profile_id [String, nil] Reference to another profile for WhatsApp configuration
        #
        #   @param whatsapp_phone_number [String, nil] Direct WhatsApp phone number
      end
    end
  end
end
