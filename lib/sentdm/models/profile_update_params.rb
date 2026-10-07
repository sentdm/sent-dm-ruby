# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#update
    class ProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!attribute allow_contact_sharing
      #   @deprecated
      #
      #   Deprecated. Accepted and ignored. Contact and template sharing between sender
      #   profiles is gone — a profile sees only what it owns, and the organization still
      #   sees all of its profiles' contacts and templates through read-time widening. The
      #   four columns behind these flags were dropped by M260720120000.
      #
      #   Retired the same way as SendingPhoneNumberProfileId, and for the same reason:
      #   the properties stay bound so an SDK that assigns them keeps compiling, and a 400
      #   would break a working integration over a capability that is gone regardless.
      #   Every profile reports all four as false, so a caller that checks its own write
      #   can see it did not take.
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_number_change_during_onboarding
      #   Whether number changes are allowed during onboarding (optional)
      #
      #   @return [Boolean, nil]
      optional :allow_number_change_during_onboarding, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute allow_template_sharing
      #   @deprecated
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute billing_contact
      #   Billing contact information for a profile. Required when billing_model is
      #   "profile" or "profile_and_organization".
      #
      #   @return [Sentdm::Models::BillingContactInfo, nil]
      optional :billing_contact, -> { Sentdm::BillingContactInfo }, nil?: true

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization (optional).
      #
      #   - "organization": the organization's billing details are used; no profile-level
      #     billing info needed.
      #   - "profile": the profile is billed independently; billing_contact is required.
      #   - "profile_and_organization": the profile is billed first with the organization
      #     as fallback; billing_contact is required.
      #
      #   @return [String, nil]
      optional :billing_model, String, nil?: true

      # @!attribute brand
      #   Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @return [Sentdm::Models::BrandsBrandData, nil]
      optional :brand, -> { Sentdm::BrandsBrandData }, nil?: true

      # @!attribute description
      #   Profile description (optional)
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute icon
      #   Profile icon URL (optional)
      #
      #   @return [String, nil]
      optional :icon, String, nil?: true

      # @!attribute inherit_contacts
      #   @deprecated
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from organization (optional)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from organization (optional)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_templates
      #   @deprecated
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute name
      #   Profile name (optional)
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute payment_details
      #   Payment card details for this profile (optional). Accepted when billing_model is
      #   "profile" or "profile_and_organization". Not persisted on our servers —
      #   forwarded to the payment processor.
      #
      #   @return [Sentdm::Models::PaymentDetails, nil]
      optional :payment_details, -> { Sentdm::PaymentDetails }, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute sending_phone_number
      #   Direct phone number for SMS sending (optional)
      #
      #   @return [String, nil]
      optional :sending_phone_number, String, nil?: true

      # @!attribute sending_phone_number_profile_id
      #   @deprecated
      #
      #   Deprecated. Accepted and ignored. Sender borrowing is gone: a profile cannot
      #   send from another profile's SMS number. Supplying this changes nothing and the
      #   request still succeeds.
      #
      #   Bound rather than dropped so the property survives on the wire and in a
      #   generated client — an SDK that assigns it keeps compiling, which is the
      #   compatibility this exists for. It is deliberately not refused: a 400 here would
      #   break an integration that is otherwise working, and the capability it asks for
      #   is gone either way.
      #
      #   The trade-off, stated plainly. A caller asking for borrowing is told it
      #   succeeded when nothing happened. What makes that survivable is the read:
      #   sending_phone_number_profile_id comes back null on every profile, so a caller
      #   that checks its own write can see it did not take. Every request that carries
      #   one is logged, so we can tell when nobody is sending it any more and the field
      #   can go for real.
      #
      #   Give the profile a sender of its own instead: POST /v3/channels/sms with the
      #   x-profile-id header naming it.
      #
      #   @return [String, nil]
      optional :sending_phone_number_profile_id, String, nil?: true

      # @!attribute sending_whatsapp_number_profile_id
      #   @deprecated
      #
      #   @return [String, nil]
      optional :sending_whatsapp_number_profile_id, String, nil?: true

      # @!attribute short_name
      #   Profile short name/abbreviation (optional). Must be 3–11 characters, contain
      #   only letters, numbers, and spaces, and include at least one letter. Example:
      #   "SALES", "Mkt 2", "Support1".
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute whatsapp_phone_number
      #   Direct phone number for WhatsApp sending (optional)
      #
      #   @return [String, nil]
      optional :whatsapp_phone_number, String, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(profile_id:, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, payment_details: nil, sandbox: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, whatsapp_phone_number: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileUpdateParams} for more details.
      #
      #   @param profile_id [String]
      #
      #   @param allow_contact_sharing [Boolean, nil] Deprecated. Accepted and ignored. Contact and template sharing between sender pr
      #
      #   @param allow_number_change_during_onboarding [Boolean, nil] Whether number changes are allowed during onboarding (optional)
      #
      #   @param allow_template_sharing [Boolean, nil]
      #
      #   @param billing_contact [Sentdm::Models::BillingContactInfo, nil] Billing contact information for a profile.
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (optional).
      #
      #   @param brand [Sentdm::Models::BrandsBrandData, nil] Brand and KYC data grouped into contact, business, and compliance sections
      #
      #   @param description [String, nil] Profile description (optional)
      #
      #   @param icon [String, nil] Profile icon URL (optional)
      #
      #   @param inherit_contacts [Boolean, nil]
      #
      #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from organization (optional)
      #
      #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from organization (optional)
      #
      #   @param inherit_templates [Boolean, nil]
      #
      #   @param name [String, nil] Profile name (optional)
      #
      #   @param payment_details [Sentdm::Models::PaymentDetails, nil] Payment card details for this profile (optional).
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param sending_phone_number [String, nil] Direct phone number for SMS sending (optional)
      #
      #   @param sending_phone_number_profile_id [String, nil] Deprecated. Accepted and ignored. Sender borrowing is gone: a profile cannot sen
      #
      #   @param sending_whatsapp_number_profile_id [String, nil]
      #
      #   @param short_name [String, nil] Profile short name/abbreviation (optional). Must be 3–11 characters, contain onl
      #
      #   @param whatsapp_phone_number [String, nil] Direct phone number for WhatsApp sending (optional)
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
