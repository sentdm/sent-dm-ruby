# typed: strong

module SentDm
  module Models
    class ProfileCreateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::ProfileCreateParams, SentDm::Internal::AnyHash)
        end

      # Whether contacts are shared across profiles (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allow_contact_sharing

      sig { params(allow_contact_sharing: T::Boolean).void }
      attr_writer :allow_contact_sharing

      # Whether templates are shared across profiles (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allow_template_sharing

      sig { params(allow_template_sharing: T::Boolean).void }
      attr_writer :allow_template_sharing

      # Billing model: profile, organization, or profile_and_organization (default:
      # profile)
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Profile description (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Profile icon URL (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      # Whether this profile inherits contacts from organization (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

      # Whether this profile inherits TCR brand from organization (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from organization (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_campaign

      # Whether this profile inherits templates from organization (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_templates

      # Profile name (required)
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Profile short name/abbreviation (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          allow_contact_sharing: T::Boolean,
          allow_template_sharing: T::Boolean,
          billing_model: T.nilable(String),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: String,
          short_name: T.nilable(String),
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether contacts are shared across profiles (default: false)
        allow_contact_sharing: nil,
        # Whether templates are shared across profiles (default: false)
        allow_template_sharing: nil,
        # Billing model: profile, organization, or profile_and_organization (default:
        # profile)
        billing_model: nil,
        # Profile description (optional)
        description: nil,
        # Profile icon URL (optional)
        icon: nil,
        # Whether this profile inherits contacts from organization (default: true)
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from organization (default: true)
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from organization (default: true)
        inherit_tcr_campaign: nil,
        # Whether this profile inherits templates from organization (default: true)
        inherit_templates: nil,
        # Profile name (required)
        name: nil,
        # Profile short name/abbreviation (optional)
        short_name: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            allow_contact_sharing: T::Boolean,
            allow_template_sharing: T::Boolean,
            billing_model: T.nilable(String),
            description: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean),
            name: String,
            short_name: T.nilable(String),
            test_mode: T::Boolean,
            idempotency_key: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
