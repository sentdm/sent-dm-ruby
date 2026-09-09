# typed: strong

module Sentdm
  module Models
    class ProfileSettings < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileSettings, Sentdm::Internal::AnyHash)
        end

      # Always false. A profile no longer shares contacts with sibling profiles — it
      # sees only what it owns. Retained so existing v3 clients reading
      # allow_contact_sharing keep deserializing; it carries no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Always false. A profile no longer shares templates with sibling profiles.
      # Retained so existing v3 clients reading allow_template_sharing keep
      # deserializing; it carries no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing model: profile, organization, or profile_and_organization
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Always false. A profile no longer inherits its organization's contacts. Retained
      # so existing v3 clients reading inherit_contacts keep deserializing; it carries
      # no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

      # Whether this profile inherits TCR brand from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_campaign

      # Always false. A profile no longer inherits its organization's templates.
      # Retained so existing v3 clients reading inherit_templates keep deserializing; it
      # carries no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_templates

      # Profile configuration settings
      sig do
        params(
          allow_contact_sharing: T.nilable(T::Boolean),
          allow_template_sharing: T.nilable(T::Boolean),
          billing_model: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean)
        ).returns(T.attached_class)
      end
      def self.new(
        # Always false. A profile no longer shares contacts with sibling profiles — it
        # sees only what it owns. Retained so existing v3 clients reading
        # allow_contact_sharing keep deserializing; it carries no information.
        allow_contact_sharing: nil,
        # Always false. A profile no longer shares templates with sibling profiles.
        # Retained so existing v3 clients reading allow_template_sharing keep
        # deserializing; it carries no information.
        allow_template_sharing: nil,
        # Billing model: profile, organization, or profile_and_organization
        billing_model: nil,
        # Always false. A profile no longer inherits its organization's contacts. Retained
        # so existing v3 clients reading inherit_contacts keep deserializing; it carries
        # no information.
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from the organization
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from the organization
        inherit_tcr_campaign: nil,
        # Always false. A profile no longer inherits its organization's templates.
        # Retained so existing v3 clients reading inherit_templates keep deserializing; it
        # carries no information.
        inherit_templates: nil
      )
      end

      sig do
        override.returns(
          {
            allow_contact_sharing: T.nilable(T::Boolean),
            allow_template_sharing: T.nilable(T::Boolean),
            billing_model: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean)
          }
        )
      end
      def to_hash
      end
    end
  end
end
