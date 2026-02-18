# typed: strong

module Sentdm
  module Models
    class ProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileUpdateParams, Sentdm::Internal::AnyHash)
        end

      # Whether contacts are shared across profiles (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Whether number changes are allowed during onboarding (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_number_change_during_onboarding

      # Whether templates are shared across profiles (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing model: profile, organization, or profile_and_organization (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Profile description (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Profile icon URL (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      # Whether this profile inherits contacts from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

      # Whether this profile inherits TCR brand from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_campaign

      # Whether this profile inherits templates from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_templates

      # Profile name (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Profile ID from route parameter
      sig { returns(T.nilable(String)) }
      attr_reader :body_profile_id

      sig { params(body_profile_id: String).void }
      attr_writer :body_profile_id

      # Direct phone number for SMS sending (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number

      # Reference to another profile to use for SMS/Telnyx configuration (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

      # Reference to another profile to use for WhatsApp configuration (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_whatsapp_number_profile_id

      # Profile short name/abbreviation (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      # Direct phone number for WhatsApp sending (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :whatsapp_phone_number

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          allow_contact_sharing: T.nilable(T::Boolean),
          allow_number_change_during_onboarding: T.nilable(T::Boolean),
          allow_template_sharing: T.nilable(T::Boolean),
          billing_model: T.nilable(String),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: T.nilable(String),
          body_profile_id: String,
          sending_phone_number: T.nilable(String),
          sending_phone_number_profile_id: T.nilable(String),
          sending_whatsapp_number_profile_id: T.nilable(String),
          short_name: T.nilable(String),
          test_mode: T::Boolean,
          whatsapp_phone_number: T.nilable(String),
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether contacts are shared across profiles (optional)
        allow_contact_sharing: nil,
        # Whether number changes are allowed during onboarding (optional)
        allow_number_change_during_onboarding: nil,
        # Whether templates are shared across profiles (optional)
        allow_template_sharing: nil,
        # Billing model: profile, organization, or profile_and_organization (optional)
        billing_model: nil,
        # Profile description (optional)
        description: nil,
        # Profile icon URL (optional)
        icon: nil,
        # Whether this profile inherits contacts from organization (optional)
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from organization (optional)
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from organization (optional)
        inherit_tcr_campaign: nil,
        # Whether this profile inherits templates from organization (optional)
        inherit_templates: nil,
        # Profile name (optional)
        name: nil,
        # Profile ID from route parameter
        body_profile_id: nil,
        # Direct phone number for SMS sending (optional)
        sending_phone_number: nil,
        # Reference to another profile to use for SMS/Telnyx configuration (optional)
        sending_phone_number_profile_id: nil,
        # Reference to another profile to use for WhatsApp configuration (optional)
        sending_whatsapp_number_profile_id: nil,
        # Profile short name/abbreviation (optional)
        short_name: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        # Direct phone number for WhatsApp sending (optional)
        whatsapp_phone_number: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            allow_contact_sharing: T.nilable(T::Boolean),
            allow_number_change_during_onboarding: T.nilable(T::Boolean),
            allow_template_sharing: T.nilable(T::Boolean),
            billing_model: T.nilable(String),
            description: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean),
            name: T.nilable(String),
            body_profile_id: String,
            sending_phone_number: T.nilable(String),
            sending_phone_number_profile_id: T.nilable(String),
            sending_whatsapp_number_profile_id: T.nilable(String),
            short_name: T.nilable(String),
            test_mode: T::Boolean,
            whatsapp_phone_number: T.nilable(String),
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
