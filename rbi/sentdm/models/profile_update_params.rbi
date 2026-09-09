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

      # Deprecated. Accepted and ignored. Contact and template sharing between sender
      # profiles is gone — a profile sees only what it owns, and the organization still
      # sees all of its profiles' contacts and templates through read-time widening. The
      # four columns behind these flags were dropped by M260720120000.
      #
      # Retired the same way as SendingPhoneNumberProfileId, and for the same reason:
      # the properties stay bound so an SDK that assigns them keeps compiling, and a 400
      # would break a working integration over a capability that is gone regardless.
      # Every profile reports all four as false, so a caller that checks its own write
      # can see it did not take.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Whether number changes are allowed during onboarding (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_number_change_during_onboarding

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing contact information for a profile. Required when billing_model is
      # "profile" or "profile_and_organization".
      sig { returns(T.nilable(Sentdm::BillingContactInfo)) }
      attr_reader :billing_contact

      sig do
        params(
          billing_contact: T.nilable(Sentdm::BillingContactInfo::OrHash)
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

      # Brand and KYC data grouped into contact, business, and compliance sections
      sig { returns(T.nilable(Sentdm::BrandsBrandData)) }
      attr_reader :brand

      sig { params(brand: T.nilable(Sentdm::BrandsBrandData::OrHash)).void }
      attr_writer :brand

      # Profile description (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Profile icon URL (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :icon

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

      # Whether this profile inherits TCR brand from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_brand

      # Whether this profile inherits TCR campaign from organization (optional)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_tcr_campaign

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_templates

      # Profile name (optional)
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Payment card details for this profile (optional). Accepted when billing_model is
      # "profile" or "profile_and_organization". Not persisted on our servers —
      # forwarded to the payment processor.
      sig { returns(T.nilable(Sentdm::PaymentDetails)) }
      attr_reader :payment_details

      sig do
        params(payment_details: T.nilable(Sentdm::PaymentDetails::OrHash)).void
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

      # Deprecated. Accepted and ignored. Sender borrowing is gone: a profile cannot
      # send from another profile's SMS number. Supplying this changes nothing and the
      # request still succeeds.
      #
      # Bound rather than dropped so the property survives on the wire and in a
      # generated client — an SDK that assigns it keeps compiling, which is the
      # compatibility this exists for. It is deliberately not refused: a 400 here would
      # break an integration that is otherwise working, and the capability it asks for
      # is gone either way.
      #
      # The trade-off, stated plainly. A caller asking for borrowing is told it
      # succeeded when nothing happened. What makes that survivable is the read:
      # sending_phone_number_profile_id comes back null on every profile, so a caller
      # that checks its own write can see it did not take. Every request that carries
      # one is logged, so we can tell when nobody is sending it any more and the field
      # can go for real.
      #
      # Give the profile a sender of its own instead: POST /v3/channels/sms with the
      # x-profile-id header naming it.
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

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
          billing_contact: T.nilable(Sentdm::BillingContactInfo::OrHash),
          billing_model: T.nilable(String),
          brand: T.nilable(Sentdm::BrandsBrandData::OrHash),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: T.nilable(String),
          payment_details: T.nilable(Sentdm::PaymentDetails::OrHash),
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
        # Deprecated. Accepted and ignored. Contact and template sharing between sender
        # profiles is gone — a profile sees only what it owns, and the organization still
        # sees all of its profiles' contacts and templates through read-time widening. The
        # four columns behind these flags were dropped by M260720120000.
        #
        # Retired the same way as SendingPhoneNumberProfileId, and for the same reason:
        # the properties stay bound so an SDK that assigns them keeps compiling, and a 400
        # would break a working integration over a capability that is gone regardless.
        # Every profile reports all four as false, so a caller that checks its own write
        # can see it did not take.
        allow_contact_sharing: nil,
        # Whether number changes are allowed during onboarding (optional)
        allow_number_change_during_onboarding: nil,
        allow_template_sharing: nil,
        # Billing contact information for a profile. Required when billing_model is
        # "profile" or "profile_and_organization".
        billing_contact: nil,
        # Billing model: profile, organization, or profile_and_organization (optional).
        #
        # - "organization": the organization's billing details are used; no profile-level
        #   billing info needed.
        # - "profile": the profile is billed independently; billing_contact is required.
        # - "profile_and_organization": the profile is billed first with the organization
        #   as fallback; billing_contact is required.
        billing_model: nil,
        # Brand and KYC data grouped into contact, business, and compliance sections
        brand: nil,
        # Profile description (optional)
        description: nil,
        # Profile icon URL (optional)
        icon: nil,
        inherit_contacts: nil,
        # Whether this profile inherits TCR brand from organization (optional)
        inherit_tcr_brand: nil,
        # Whether this profile inherits TCR campaign from organization (optional)
        inherit_tcr_campaign: nil,
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
        # Deprecated. Accepted and ignored. Sender borrowing is gone: a profile cannot
        # send from another profile's SMS number. Supplying this changes nothing and the
        # request still succeeds.
        #
        # Bound rather than dropped so the property survives on the wire and in a
        # generated client — an SDK that assigns it keeps compiling, which is the
        # compatibility this exists for. It is deliberately not refused: a 400 here would
        # break an integration that is otherwise working, and the capability it asks for
        # is gone either way.
        #
        # The trade-off, stated plainly. A caller asking for borrowing is told it
        # succeeded when nothing happened. What makes that survivable is the read:
        # sending_phone_number_profile_id comes back null on every profile, so a caller
        # that checks its own write can see it did not take. Every request that carries
        # one is logged, so we can tell when nobody is sending it any more and the field
        # can go for real.
        #
        # Give the profile a sender of its own instead: POST /v3/channels/sms with the
        # x-profile-id header naming it.
        sending_phone_number_profile_id: nil,
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
            billing_contact: T.nilable(Sentdm::BillingContactInfo),
            billing_model: T.nilable(String),
            brand: T.nilable(Sentdm::BrandsBrandData),
            description: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T.nilable(T::Boolean),
            inherit_tcr_campaign: T.nilable(T::Boolean),
            inherit_templates: T.nilable(T::Boolean),
            name: T.nilable(String),
            payment_details: T.nilable(Sentdm::PaymentDetails),
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
    end
  end
end
