# frozen_string_literal: true

module Sentdm
  module Models
    class ProfileSettings < Sentdm::Internal::Type::BaseModel
      # @!attribute allow_contact_sharing
      #   @deprecated
      #
      #   Always false. A profile no longer shares contacts with sibling profiles — it
      #   sees only what it owns. Retained so existing v3 clients reading
      #   allow_contact_sharing keep deserializing; it carries no information.
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_template_sharing
      #   @deprecated
      #
      #   Always false. A profile no longer shares templates with sibling profiles.
      #   Retained so existing v3 clients reading allow_template_sharing keep
      #   deserializing; it carries no information.
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization
      #
      #   @return [String, nil]
      optional :billing_model, String, nil?: true

      # @!attribute inherit_contacts
      #   @deprecated
      #
      #   Always false. A profile no longer inherits its organization's contacts. Retained
      #   so existing v3 clients reading inherit_contacts keep deserializing; it carries
      #   no information.
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from the organization
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_templates
      #   @deprecated
      #
      #   Always false. A profile no longer inherits its organization's templates.
      #   Retained so existing v3 clients reading inherit_templates keep deserializing; it
      #   carries no information.
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

      # @!method initialize(allow_contact_sharing: nil, allow_template_sharing: nil, billing_model: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileSettings} for more details.
      #
      #   Profile configuration settings
      #
      #   @param allow_contact_sharing [Boolean, nil] Always false. A profile no longer shares contacts with sibling profiles — it see
      #
      #   @param allow_template_sharing [Boolean, nil] Always false. A profile no longer shares templates with sibling profiles. Retain
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization
      #
      #   @param inherit_contacts [Boolean, nil] Always false. A profile no longer inherits its organization's contacts. Retained
      #
      #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from the organization
      #
      #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from the organization
      #
      #   @param inherit_templates [Boolean, nil] Always false. A profile no longer inherits its organization's templates. Retaine
    end
  end
end
