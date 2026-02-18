# frozen_string_literal: true

module SentDm
  module Models
    class ProfileSettings < SentDm::Internal::Type::BaseModel
      # @!attribute allow_contact_sharing
      #   Whether contacts are shared across profiles in the organization
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_template_sharing
      #   Whether templates are shared across profiles in the organization
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization
      #
      #   @return [String, nil]
      optional :billing_model, String, nil?: true

      # @!attribute inherit_contacts
      #   Whether this profile inherits contacts from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_templates
      #   Whether this profile inherits templates from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, SentDm::Internal::Type::Boolean, nil?: true

      # @!method initialize(allow_contact_sharing: nil, allow_template_sharing: nil, billing_model: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil)
      #   Profile configuration settings
      #
      #   @param allow_contact_sharing [Boolean, nil] Whether contacts are shared across profiles in the organization
      #
      #   @param allow_template_sharing [Boolean, nil] Whether templates are shared across profiles in the organization
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization
      #
      #   @param inherit_contacts [Boolean, nil] Whether this profile inherits contacts from the organization
      #
      #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from the organization
      #
      #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from the organization
      #
      #   @param inherit_templates [Boolean, nil] Whether this profile inherits templates from the organization
    end
  end
end
