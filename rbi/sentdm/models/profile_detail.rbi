# typed: strong

module Sentdm
  module Models
    class ProfileDetail < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ProfileDetail, Sentdm::Internal::AnyHash) }

      # Profile unique identifier
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Whether contacts are shared across profiles in the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allow_contact_sharing

      sig { params(allow_contact_sharing: T::Boolean).void }
      attr_writer :allow_contact_sharing

      # Whether number changes are allowed during onboarding
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_number_change_during_onboarding

      # Whether templates are shared across profiles in the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allow_template_sharing

      sig { params(allow_template_sharing: T::Boolean).void }
      attr_writer :allow_template_sharing

      # Billing contact for this profile. Present when billing_model is "profile" or
      # "profile_and_organization".
      sig { returns(T.nilable(Sentdm::ProfileDetail::BillingContact)) }
      attr_reader :billing_contact

      sig do
        params(
          billing_contact:
            T.nilable(Sentdm::ProfileDetail::BillingContact::OrHash)
        ).void
      end
      attr_writer :billing_contact

      # Billing model: profile, organization, or profile_and_organization
      sig { returns(T.nilable(String)) }
      attr_reader :billing_model

      sig { params(billing_model: String).void }
      attr_writer :billing_model

      # Brand associated with this profile. Null if no brand has been configured yet.
      # Includes KYC information and TCR registration status.
      sig { returns(T.nilable(Sentdm::BrandWithKYC)) }
      attr_reader :brand

      sig { params(brand: T.nilable(Sentdm::BrandWithKYC::OrHash)).void }
      attr_writer :brand

      # When the profile was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Profile description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Profile email (inherited from organization)
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # Profile icon URL
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      # Whether this profile inherits contacts from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inherit_contacts

      sig { params(inherit_contacts: T::Boolean).void }
      attr_writer :inherit_contacts

      # Whether this profile inherits TCR brand from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inherit_tcr_brand

      sig { params(inherit_tcr_brand: T::Boolean).void }
      attr_writer :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inherit_tcr_campaign

      sig { params(inherit_tcr_campaign: T::Boolean).void }
      attr_writer :inherit_tcr_campaign

      # Whether this profile inherits templates from the organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inherit_templates

      sig { params(inherit_templates: T::Boolean).void }
      attr_writer :inherit_templates

      # Profile name
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Parent organization ID
      sig { returns(T.nilable(String)) }
      attr_accessor :organization_id

      # Direct SMS phone number
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number

      # Reference to another profile for SMS/Telnyx configuration
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

      # Reference to another profile for WhatsApp configuration
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_whatsapp_number_profile_id

      # Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces
      # only, with at least one letter.
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Profile setup status: incomplete, pending_review, approved, rejected
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When the profile was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # WhatsApp Business Account ID associated with this profile. Present whether the
      # WABA is inherited from the organization or configured directly.
      sig { returns(T.nilable(String)) }
      attr_accessor :waba_id

      # Direct WhatsApp phone number
      sig { returns(T.nilable(String)) }
      attr_accessor :whatsapp_phone_number

      # Detailed profile response for v3 API
      sig do
        params(
          id: String,
          allow_contact_sharing: T::Boolean,
          allow_number_change_during_onboarding: T.nilable(T::Boolean),
          allow_template_sharing: T::Boolean,
          billing_contact:
            T.nilable(Sentdm::ProfileDetail::BillingContact::OrHash),
          billing_model: String,
          brand: T.nilable(Sentdm::BrandWithKYC::OrHash),
          created_at: Time,
          description: T.nilable(String),
          email: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T::Boolean,
          inherit_tcr_brand: T::Boolean,
          inherit_tcr_campaign: T::Boolean,
          inherit_templates: T::Boolean,
          name: String,
          organization_id: T.nilable(String),
          sending_phone_number: T.nilable(String),
          sending_phone_number_profile_id: T.nilable(String),
          sending_whatsapp_number_profile_id: T.nilable(String),
          short_name: T.nilable(String),
          status: String,
          updated_at: T.nilable(Time),
          waba_id: T.nilable(String),
          whatsapp_phone_number: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Profile unique identifier
        id: nil,
        # Whether contacts are shared across profiles in the organization
        allow_contact_sharing: nil,
        # Whether number changes are allowed during onboarding
        allow_number_change_during_onboarding: nil,
        # Whether templates are shared across profiles in the organization
        allow_template_sharing: nil,
        # Billing contact for this profile. Present when billing_model is "profile" or
        # "profile_and_organization".
        billing_contact: nil,
        # Billing model: profile, organization, or profile_and_organization
        billing_model: nil,
        # Brand associated with this profile. Null if no brand has been configured yet.
        # Includes KYC information and TCR registration status.
        brand: nil,
        # When the profile was created
        created_at: nil,
        # Profile description
        description: nil,
        # Profile email (inherited from organization)
        email: nil,
        # Profile icon URL
        icon: nil,
        # Whether this profile inherits contacts from the organization
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from the organization
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from the organization
        inherit_tcr_campaign: nil,
        # Whether this profile inherits templates from the organization
        inherit_templates: nil,
        # Profile name
        name: nil,
        # Parent organization ID
        organization_id: nil,
        # Direct SMS phone number
        sending_phone_number: nil,
        # Reference to another profile for SMS/Telnyx configuration
        sending_phone_number_profile_id: nil,
        # Reference to another profile for WhatsApp configuration
        sending_whatsapp_number_profile_id: nil,
        # Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces
        # only, with at least one letter.
        short_name: nil,
        # Profile setup status: incomplete, pending_review, approved, rejected
        status: nil,
        # When the profile was last updated
        updated_at: nil,
        # WhatsApp Business Account ID associated with this profile. Present whether the
        # WABA is inherited from the organization or configured directly.
        waba_id: nil,
        # Direct WhatsApp phone number
        whatsapp_phone_number: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            allow_contact_sharing: T::Boolean,
            allow_number_change_during_onboarding: T.nilable(T::Boolean),
            allow_template_sharing: T::Boolean,
            billing_contact: T.nilable(Sentdm::ProfileDetail::BillingContact),
            billing_model: String,
            brand: T.nilable(Sentdm::BrandWithKYC),
            created_at: Time,
            description: T.nilable(String),
            email: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T::Boolean,
            inherit_tcr_brand: T::Boolean,
            inherit_tcr_campaign: T::Boolean,
            inherit_templates: T::Boolean,
            name: String,
            organization_id: T.nilable(String),
            sending_phone_number: T.nilable(String),
            sending_phone_number_profile_id: T.nilable(String),
            sending_whatsapp_number_profile_id: T.nilable(String),
            short_name: T.nilable(String),
            status: String,
            updated_at: T.nilable(Time),
            waba_id: T.nilable(String),
            whatsapp_phone_number: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class BillingContact < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ProfileDetail::BillingContact,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :address

        sig { returns(T.nilable(String)) }
        attr_accessor :email

        sig { returns(T.nilable(String)) }
        attr_accessor :name

        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # Billing contact for this profile. Present when billing_model is "profile" or
        # "profile_and_organization".
        sig do
          params(
            address: T.nilable(String),
            email: T.nilable(String),
            name: T.nilable(String),
            phone: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(address: nil, email: nil, name: nil, phone: nil)
        end

        sig do
          override.returns(
            {
              address: T.nilable(String),
              email: T.nilable(String),
              name: T.nilable(String),
              phone: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
