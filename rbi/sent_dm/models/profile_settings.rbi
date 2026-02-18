# typed: strong

module SentDm
  module Models
    class ProfileSettings < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::ProfileSettings, SentDm::Internal::AnyHash)
        end

      # Whether contacts are shared across profiles in the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Whether templates are shared across profiles in the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing model: profile, organization, or profile_and_organization
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Whether this profile inherits contacts from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

      # Whether this profile inherits TCR brand from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_campaign

      # Whether this profile inherits templates from the organization
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
        # Whether contacts are shared across profiles in the organization
        allow_contact_sharing: nil,
        # Whether templates are shared across profiles in the organization
        allow_template_sharing: nil,
        # Billing model: profile, organization, or profile_and_organization
        billing_model: nil,
        # Whether this profile inherits contacts from the organization
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from the organization
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from the organization
        inherit_tcr_campaign: nil,
        # Whether this profile inherits templates from the organization
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
