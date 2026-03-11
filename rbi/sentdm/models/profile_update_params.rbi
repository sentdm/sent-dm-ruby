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

      sig { returns(String) }
      attr_accessor :profile_id

      # Whether contacts are shared across profiles (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Whether number changes are allowed during onboarding (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_number_change_during_onboarding

      # Whether templates are shared across profiles (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing contact for this profile. Required when billing_model is "profile" or
      # "profile_and_organization" and no billing contact has been configured yet.
      # Identifies who receives invoices and who is responsible for payment.
      sig { returns(T.nilable(Sentdm::ProfileUpdateParams::BillingContact)) }
      attr_reader :billing_contact

      sig do
        params(
          billing_contact:
            T.nilable(Sentdm::ProfileUpdateParams::BillingContact::OrHash)
        ).void
      end
      attr_writer :billing_contact

      # Billing model: profile, organization, or profile_and_organization (optional).
      #
      # - "organization": the organization's billing details are used; no profile-level
      #   billing info needed.
      # - "profile": the profile is billed independently; billing_contact is required.
      # - "profile_and_organization": the profile is billed first with the organization
      #   as fallback; billing_contact is required.
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Brand and KYC information for this profile (optional). When provided, creates or
      # updates the brand associated with this profile. Cannot be set when
      # inherit_tcr_brand is true. Once a brand has been submitted to TCR it cannot be
      # modified.
      sig { returns(T.nilable(Sentdm::BrandData)) }
      attr_reader :brand

      sig { params(brand: T.nilable(Sentdm::BrandData::OrHash)).void }
      attr_writer :brand

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

      # Payment card details for this profile (optional). Accepted when billing_model is
      # "profile" or "profile_and_organization". Not persisted on our servers —
      # forwarded to the payment processor.
      sig { returns(T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails)) }
      attr_reader :payment_details

      sig do
        params(
          payment_details:
            T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails::OrHash)
        ).void
      end
      attr_writer :payment_details

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Direct phone number for SMS sending (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number

      # Reference to another profile to use for SMS/Telnyx configuration (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

      # Reference to another profile to use for WhatsApp configuration (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_whatsapp_number_profile_id

      # Profile short name/abbreviation (optional). Must be 3–11 characters, contain
      # only letters, numbers, and spaces, and include at least one letter. Example:
      # "SALES", "Mkt 2", "Support1".
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Direct phone number for WhatsApp sending (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :whatsapp_phone_number

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          profile_id: String,
          allow_contact_sharing: T.nilable(T::Boolean),
          allow_number_change_during_onboarding: T.nilable(T::Boolean),
          allow_template_sharing: T.nilable(T::Boolean),
          billing_contact:
            T.nilable(Sentdm::ProfileUpdateParams::BillingContact::OrHash),
          billing_model: T.nilable(String),
          brand: T.nilable(Sentdm::BrandData::OrHash),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: T.nilable(String),
          payment_details:
            T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails::OrHash),
          sandbox: T::Boolean,
          sending_phone_number: T.nilable(String),
          sending_phone_number_profile_id: T.nilable(String),
          sending_whatsapp_number_profile_id: T.nilable(String),
          short_name: T.nilable(String),
          whatsapp_phone_number: T.nilable(String),
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        profile_id:,
        # Whether contacts are shared across profiles (optional)
        allow_contact_sharing: nil,
        # Whether number changes are allowed during onboarding (optional)
        allow_number_change_during_onboarding: nil,
        # Whether templates are shared across profiles (optional)
        allow_template_sharing: nil,
        # Billing contact for this profile. Required when billing_model is "profile" or
        # "profile_and_organization" and no billing contact has been configured yet.
        # Identifies who receives invoices and who is responsible for payment.
        billing_contact: nil,
        # Billing model: profile, organization, or profile_and_organization (optional).
        #
        # - "organization": the organization's billing details are used; no profile-level
        #   billing info needed.
        # - "profile": the profile is billed independently; billing_contact is required.
        # - "profile_and_organization": the profile is billed first with the organization
        #   as fallback; billing_contact is required.
        billing_model: nil,
        # Brand and KYC information for this profile (optional). When provided, creates or
        # updates the brand associated with this profile. Cannot be set when
        # inherit_tcr_brand is true. Once a brand has been submitted to TCR it cannot be
        # modified.
        brand: nil,
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
        # Payment card details for this profile (optional). Accepted when billing_model is
        # "profile" or "profile_and_organization". Not persisted on our servers —
        # forwarded to the payment processor.
        payment_details: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Direct phone number for SMS sending (optional)
        sending_phone_number: nil,
        # Reference to another profile to use for SMS/Telnyx configuration (optional)
        sending_phone_number_profile_id: nil,
        # Reference to another profile to use for WhatsApp configuration (optional)
        sending_whatsapp_number_profile_id: nil,
        # Profile short name/abbreviation (optional). Must be 3–11 characters, contain
        # only letters, numbers, and spaces, and include at least one letter. Example:
        # "SALES", "Mkt 2", "Support1".
        short_name: nil,
        # Direct phone number for WhatsApp sending (optional)
        whatsapp_phone_number: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            profile_id: String,
            allow_contact_sharing: T.nilable(T::Boolean),
            allow_number_change_during_onboarding: T.nilable(T::Boolean),
            allow_template_sharing: T.nilable(T::Boolean),
            billing_contact:
              T.nilable(Sentdm::ProfileUpdateParams::BillingContact),
            billing_model: T.nilable(String),
            brand: T.nilable(Sentdm::BrandData),
            description: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean),
            name: T.nilable(String),
            payment_details:
              T.nilable(Sentdm::ProfileUpdateParams::PaymentDetails),
            sandbox: T::Boolean,
            sending_phone_number: T.nilable(String),
            sending_phone_number_profile_id: T.nilable(String),
            sending_whatsapp_number_profile_id: T.nilable(String),
            short_name: T.nilable(String),
            whatsapp_phone_number: T.nilable(String),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class BillingContact < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ProfileUpdateParams::BillingContact,
              Sentdm::Internal::AnyHash
            )
          end

        # Email address where invoices will be sent (required)
        sig { returns(String) }
        attr_accessor :email

        # Full name of the billing contact or company (required)
        sig { returns(String) }
        attr_accessor :name

        # Billing address (optional). Free-form text including street, city, state, postal
        # code, and country.
        sig { returns(T.nilable(String)) }
        attr_accessor :address

        # Phone number for the billing contact (optional)
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # Billing contact for this profile. Required when billing_model is "profile" or
        # "profile_and_organization" and no billing contact has been configured yet.
        # Identifies who receives invoices and who is responsible for payment.
        sig do
          params(
            email: String,
            name: String,
            address: T.nilable(String),
            phone: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Email address where invoices will be sent (required)
          email:,
          # Full name of the billing contact or company (required)
          name:,
          # Billing address (optional). Free-form text including street, city, state, postal
          # code, and country.
          address: nil,
          # Phone number for the billing contact (optional)
          phone: nil
        )
        end

        sig do
          override.returns(
            {
              email: String,
              name: String,
              address: T.nilable(String),
              phone: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class PaymentDetails < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ProfileUpdateParams::PaymentDetails,
              Sentdm::Internal::AnyHash
            )
          end

        # Card number (digits only, 13–19 characters)
        sig { returns(String) }
        attr_accessor :card_number

        # Card security code (3–4 digits)
        sig { returns(String) }
        attr_accessor :cvc

        # Card expiry date in MM/YY format (e.g. "09/27")
        sig { returns(String) }
        attr_accessor :expiry

        # Billing ZIP / postal code associated with the card
        sig { returns(String) }
        attr_accessor :zip_code

        # Payment card details for this profile (optional). Accepted when billing_model is
        # "profile" or "profile_and_organization". Not persisted on our servers —
        # forwarded to the payment processor.
        sig do
          params(
            card_number: String,
            cvc: String,
            expiry: String,
            zip_code: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Card number (digits only, 13–19 characters)
          card_number:,
          # Card security code (3–4 digits)
          cvc:,
          # Card expiry date in MM/YY format (e.g. "09/27")
          expiry:,
          # Billing ZIP / postal code associated with the card
          zip_code:
        )
        end

        sig do
          override.returns(
            {
              card_number: String,
              cvc: String,
              expiry: String,
              zip_code: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
