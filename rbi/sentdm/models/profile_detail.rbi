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

      # Always false. A profile no longer shares contacts with sibling profiles — it
      # sees only what it owns. Retained so existing v3 clients reading
      # allow_contact_sharing keep deserializing; it carries no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_contact_sharing

      # Whether number changes are allowed during onboarding
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_number_change_during_onboarding

      # Always false. A profile no longer shares templates with sibling profiles.
      # Retained so existing v3 clients reading allow_template_sharing keep
      # deserializing; it carries no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :allow_template_sharing

      # Billing contact info returned in profile responses
      sig { returns(T.nilable(Sentdm::BillingContact)) }
      attr_reader :billing_contact

      sig do
        params(billing_contact: T.nilable(Sentdm::BillingContact::OrHash)).void
      end
      attr_writer :billing_contact

      # Billing model: profile, organization, or profile_and_organization
      sig { returns(T.nilable(String)) }
      attr_reader :billing_model

      sig { params(billing_model: String).void }
      attr_writer :billing_model

      # Brand response with nested contact, business, and compliance sections — mirrors
      # the request structure.
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

      # Always false. A profile no longer inherits its organization's contacts. Retained
      # so existing v3 clients reading inherit_contacts keep deserializing; it carries
      # no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_contacts

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

      # Always false. A profile no longer inherits its organization's templates.
      # Retained so existing v3 clients reading inherit_templates keep deserializing; it
      # carries no information.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :inherit_templates

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

      # Deprecated. Always null. Sender borrowing is gone: a profile no longer points at
      # another profile for its SMS sender, and every profile owns the sender it sends
      # from.
      #
      # Kept on the wire, and never populated, because those are two different promises.
      # Removing the key changes the response's shape — a generated client loses the
      # property and stops compiling on the next regenerate, for a value that is now
      # null for every profile in existence. Keeping it null costs a key and breaks
      # nobody, and null is the honest answer rather than a placeholder: there is no
      # borrowing left to report.
      #
      # Nothing could populate it. Migration 260813161500 dropped the column and copied
      # each borrower its own channel-provider row; its Down() says outright that the
      # borrower-to-lender pairing is not recoverable. The only surviving trace is a
      # notes string on the copied row.
      sig { returns(T.nilable(String)) }
      attr_accessor :sending_phone_number_profile_id

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
          allow_contact_sharing: T.nilable(T::Boolean),
          allow_number_change_during_onboarding: T.nilable(T::Boolean),
          allow_template_sharing: T.nilable(T::Boolean),
          billing_contact: T.nilable(Sentdm::BillingContact::OrHash),
          billing_model: String,
          brand: T.nilable(Sentdm::BrandWithKYC::OrHash),
          created_at: Time,
          description: T.nilable(String),
          email: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T::Boolean,
          inherit_tcr_campaign: T::Boolean,
          inherit_templates: T.nilable(T::Boolean),
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
        # Always false. A profile no longer shares contacts with sibling profiles — it
        # sees only what it owns. Retained so existing v3 clients reading
        # allow_contact_sharing keep deserializing; it carries no information.
        allow_contact_sharing: nil,
        # Whether number changes are allowed during onboarding
        allow_number_change_during_onboarding: nil,
        # Always false. A profile no longer shares templates with sibling profiles.
        # Retained so existing v3 clients reading allow_template_sharing keep
        # deserializing; it carries no information.
        allow_template_sharing: nil,
        # Billing contact info returned in profile responses
        billing_contact: nil,
        # Billing model: profile, organization, or profile_and_organization
        billing_model: nil,
        # Brand response with nested contact, business, and compliance sections — mirrors
        # the request structure.
        brand: nil,
        # When the profile was created
        created_at: nil,
        # Profile description
        description: nil,
        # Profile email (inherited from organization)
        email: nil,
        # Profile icon URL
        icon: nil,
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
        inherit_templates: nil,
        # Profile name
        name: nil,
        # Parent organization ID
        organization_id: nil,
        # Direct SMS phone number
        sending_phone_number: nil,
        # Deprecated. Always null. Sender borrowing is gone: a profile no longer points at
        # another profile for its SMS sender, and every profile owns the sender it sends
        # from.
        #
        # Kept on the wire, and never populated, because those are two different promises.
        # Removing the key changes the response's shape — a generated client loses the
        # property and stops compiling on the next regenerate, for a value that is now
        # null for every profile in existence. Keeping it null costs a key and breaks
        # nobody, and null is the honest answer rather than a placeholder: there is no
        # borrowing left to report.
        #
        # Nothing could populate it. Migration 260813161500 dropped the column and copied
        # each borrower its own channel-provider row; its Down() says outright that the
        # borrower-to-lender pairing is not recoverable. The only surviving trace is a
        # notes string on the copied row.
        sending_phone_number_profile_id: nil,
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
            allow_contact_sharing: T.nilable(T::Boolean),
            allow_number_change_during_onboarding: T.nilable(T::Boolean),
            allow_template_sharing: T.nilable(T::Boolean),
            billing_contact: T.nilable(Sentdm::BillingContact),
            billing_model: String,
            brand: T.nilable(Sentdm::BrandWithKYC),
            created_at: Time,
            description: T.nilable(String),
            email: T.nilable(String),
            icon: T.nilable(String),
            inherit_contacts: T.nilable(T::Boolean),
            inherit_tcr_brand: T::Boolean,
            inherit_tcr_campaign: T::Boolean,
            inherit_templates: T.nilable(T::Boolean),
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
    end
  end
end
