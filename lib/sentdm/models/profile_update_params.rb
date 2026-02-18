# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#update
    class ProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

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

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization (optional)
      #
      #   @return [String, nil]
      optional :billing_model, String, nil?: true

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

      # @!attribute body_profile_id
      #   Profile ID from route parameter
      #
      #   @return [String, nil]
      optional :body_profile_id, String, api_name: :profile_id

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
      #   Profile short name/abbreviation (optional)
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!attribute whatsapp_phone_number
      #   Direct phone number for WhatsApp sending (optional)
      #
      #   @return [String, nil]
      optional :whatsapp_phone_number, String, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_model: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, body_profile_id: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, test_mode: nil, whatsapp_phone_number: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileUpdateParams} for more details.
      #
      #   @param allow_contact_sharing [Boolean, nil] Whether contacts are shared across profiles (optional)
      #
      #   @param allow_number_change_during_onboarding [Boolean, nil] Whether number changes are allowed during onboarding (optional)
      #
      #   @param allow_template_sharing [Boolean, nil] Whether templates are shared across profiles (optional)
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (optional)
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
      #   @param body_profile_id [String] Profile ID from route parameter
      #
      #   @param sending_phone_number [String, nil] Direct phone number for SMS sending (optional)
      #
      #   @param sending_phone_number_profile_id [String, nil] Reference to another profile to use for SMS/Telnyx configuration (optional)
      #
      #   @param sending_whatsapp_number_profile_id [String, nil] Reference to another profile to use for WhatsApp configuration (optional)
      #
      #   @param short_name [String, nil] Profile short name/abbreviation (optional)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param whatsapp_phone_number [String, nil] Direct phone number for WhatsApp sending (optional)
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
