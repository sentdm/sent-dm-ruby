# typed: strong

module Sentdm
  module Models
    class ProfileCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileCreateParams, Sentdm::Internal::AnyHash)
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

      # Billing contact for this profile. Required when billing_model is "profile" or
      # "profile_and_organization". Identifies who receives invoices and who is
      # responsible for payment.
      sig { returns(T.nilable(Sentdm::ProfileCreateParams::BillingContact)) }
      attr_reader :billing_contact

      sig do
        params(
          billing_contact:
            T.nilable(Sentdm::ProfileCreateParams::BillingContact::OrHash)
        ).void
      end
      attr_writer :billing_contact

      # Billing model: profile, organization, or profile_and_organization (default:
      # profile).
      #
      # - "organization": the organization's billing details are used; no profile-level
      #   billing info needed.
      # - "profile": the profile is billed independently; billing_contact is required.
      # - "profile_and_organization": the profile is billed first with the organization
      #   as fallback; billing_contact is required.
      sig { returns(T.nilable(String)) }
      attr_accessor :billing_model

      # Brand and KYC information for this profile (optional). When provided, creates
      # the brand associated with this profile. Cannot be set when inherit_tcr_brand is
      # true.
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

      # Payment card details for this profile (optional). Accepted when billing_model is
      # "profile" or "profile_and_organization". Not persisted on our servers —
      # forwarded to the payment processor.
      sig { returns(T.nilable(Sentdm::ProfileCreateParams::PaymentDetails)) }
      attr_reader :payment_details

      sig do
        params(
          payment_details:
            T.nilable(Sentdm::ProfileCreateParams::PaymentDetails::OrHash)
        ).void
      end
      attr_writer :payment_details

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Profile short name/abbreviation (optional). Must be 3–11 characters, contain
      # only letters, numbers, and spaces, and include at least one letter. Example:
      # "SALES", "Mkt 2", "Support1".
      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      # Direct WhatsApp Business Account credentials for this profile. When provided,
      # the profile uses its own WhatsApp Business Account instead of inheriting from
      # the organization. When omitted, the profile inherits the organization's WhatsApp
      # Business Account (requires the organization to have completed WhatsApp Embedded
      # Signup).
      sig do
        returns(T.nilable(Sentdm::ProfileCreateParams::WhatsappBusinessAccount))
      end
      attr_reader :whatsapp_business_account

      sig do
        params(
          whatsapp_business_account:
            T.nilable(
              Sentdm::ProfileCreateParams::WhatsappBusinessAccount::OrHash
            )
        ).void
      end
      attr_writer :whatsapp_business_account

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
          allow_contact_sharing: T::Boolean,
          allow_template_sharing: T::Boolean,
          billing_contact:
            T.nilable(Sentdm::ProfileCreateParams::BillingContact::OrHash),
          billing_model: T.nilable(String),
          brand: T.nilable(Sentdm::BrandData::OrHash),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: String,
          payment_details:
            T.nilable(Sentdm::ProfileCreateParams::PaymentDetails::OrHash),
          sandbox: T::Boolean,
          short_name: T.nilable(String),
          whatsapp_business_account:
            T.nilable(
              Sentdm::ProfileCreateParams::WhatsappBusinessAccount::OrHash
            ),
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether contacts are shared across profiles (default: false)
        allow_contact_sharing: nil,
        # Whether templates are shared across profiles (default: false)
        allow_template_sharing: nil,
        # Billing contact for this profile. Required when billing_model is "profile" or
        # "profile_and_organization". Identifies who receives invoices and who is
        # responsible for payment.
        billing_contact: nil,
        # Billing model: profile, organization, or profile_and_organization (default:
        # profile).
        #
        # - "organization": the organization's billing details are used; no profile-level
        #   billing info needed.
        # - "profile": the profile is billed independently; billing_contact is required.
        # - "profile_and_organization": the profile is billed first with the organization
        #   as fallback; billing_contact is required.
        billing_model: nil,
        # Brand and KYC information for this profile (optional). When provided, creates
        # the brand associated with this profile. Cannot be set when inherit_tcr_brand is
        # true.
        brand: nil,
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
        # Payment card details for this profile (optional). Accepted when billing_model is
        # "profile" or "profile_and_organization". Not persisted on our servers —
        # forwarded to the payment processor.
        payment_details: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Profile short name/abbreviation (optional). Must be 3–11 characters, contain
        # only letters, numbers, and spaces, and include at least one letter. Example:
        # "SALES", "Mkt 2", "Support1".
        short_name: nil,
        # Direct WhatsApp Business Account credentials for this profile. When provided,
        # the profile uses its own WhatsApp Business Account instead of inheriting from
        # the organization. When omitted, the profile inherits the organization's WhatsApp
        # Business Account (requires the organization to have completed WhatsApp Embedded
        # Signup).
        whatsapp_business_account: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            allow_contact_sharing: T::Boolean,
            allow_template_sharing: T::Boolean,
            billing_contact:
              T.nilable(Sentdm::ProfileCreateParams::BillingContact),
            billing_model: T.nilable(String),
            brand: T.nilable(Sentdm::BrandData),
            description: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean),
            name: String,
            payment_details:
              T.nilable(Sentdm::ProfileCreateParams::PaymentDetails),
            sandbox: T::Boolean,
            short_name: T.nilable(String),
            whatsapp_business_account:
              T.nilable(Sentdm::ProfileCreateParams::WhatsappBusinessAccount),
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
              Sentdm::ProfileCreateParams::BillingContact,
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
        # "profile_and_organization". Identifies who receives invoices and who is
        # responsible for payment.
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
              Sentdm::ProfileCreateParams::PaymentDetails,
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

      class WhatsappBusinessAccount < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ProfileCreateParams::WhatsappBusinessAccount,
              Sentdm::Internal::AnyHash
            )
          end

        # System User access token with whatsapp_business_messaging and
        # whatsapp_business_management permissions. This value is stored securely and
        # never returned in API responses.
        sig { returns(String) }
        attr_accessor :access_token

        # WhatsApp Business Account ID from Meta Business Manager
        sig { returns(String) }
        attr_accessor :waba_id

        # Phone Number ID of an existing number already registered under this WABA in Meta
        # Business Manager. Optional — when omitted, a number will be provisioned from our
        # pool and registered in the WABA during the onboarding flow. When provided, the
        # number must already exist in the WABA.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number_id

        # Direct WhatsApp Business Account credentials for this profile. When provided,
        # the profile uses its own WhatsApp Business Account instead of inheriting from
        # the organization. When omitted, the profile inherits the organization's WhatsApp
        # Business Account (requires the organization to have completed WhatsApp Embedded
        # Signup).
        sig do
          params(
            access_token: String,
            waba_id: String,
            phone_number_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # System User access token with whatsapp_business_messaging and
          # whatsapp_business_management permissions. This value is stored securely and
          # never returned in API responses.
          access_token:,
          # WhatsApp Business Account ID from Meta Business Manager
          waba_id:,
          # Phone Number ID of an existing number already registered under this WABA in Meta
          # Business Manager. Optional — when omitted, a number will be provisioned from our
          # pool and registered in the WABA during the onboarding flow. When provided, the
          # number must already exist in the WABA.
          phone_number_id: nil
        )
        end

        sig do
          override.returns(
            {
              access_token: String,
              waba_id: String,
              phone_number_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
