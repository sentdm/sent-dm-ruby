# typed: strong

module Sentdm
  module Resources
    # Manage organization profiles
    class Profiles
      # Manage organization profiles
      sig { returns(Sentdm::Resources::Profiles::Campaigns) }
      attr_reader :campaigns

      # Creates a new sender profile within an organization. Profiles represent
      # different brands, departments, or use cases, each with their own messaging
      # configuration and settings. Requires admin role in the organization.
      #
      # ## WhatsApp Business Account
      #
      # Every profile must be linked to a WhatsApp Business Account. There are two ways
      # to do this:
      #
      # **1. Inherit from organization (default)** — Omit the
      # `whatsapp_business_account` field. The profile will share the organization's
      # WhatsApp Business Account, which must have been set up via WhatsApp Embedded
      # Signup. This is the recommended path for most use cases.
      #
      # **2. Direct credentials** — Provide a `whatsapp_business_account` object with
      # `waba_id`, `phone_number_id`, and `access_token`. Use this when the profile
      # needs its own independent WhatsApp Business Account. Obtain these from Meta
      # Business Manager by creating a System User with `whatsapp_business_messaging`
      # and `whatsapp_business_management` permissions.
      #
      # If the `whatsapp_business_account` field is omitted and the organization has no
      # WhatsApp Business Account configured, the request will be rejected with
      # HTTP 422.
      #
      # ## Brand
      #
      # Include the optional `brand` field to create the brand for this profile at the
      # same time. Cannot be used when `inherit_tcr_brand` is `true`.
      #
      # ## Payment Details
      #
      # When `billing_model` is `"profile"` or `"profile_and_organization"` you may
      # include a `payment_details` object containing the card number, expiry (MM/YY),
      # CVC, and billing ZIP code. Payment details are **never stored** on our servers
      # and are forwarded directly to the payment processor. Providing `payment_details`
      # when `billing_model` is `"organization"` is not allowed.
      sig do
        params(
          allow_contact_sharing: T::Boolean,
          allow_template_sharing: T::Boolean,
          billing_contact: T.nilable(Sentdm::BillingContactInfo::OrHash),
          billing_model: T.nilable(String),
          brand: T.nilable(Sentdm::BrandsBrandData::OrHash),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: String,
          payment_details: T.nilable(Sentdm::PaymentDetails::OrHash),
          sandbox: T::Boolean,
          short_name: T.nilable(String),
          whatsapp_business_account:
            T.nilable(
              Sentdm::ProfileCreateParams::WhatsappBusinessAccount::OrHash
            ),
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfProfileDetail)
      end
      def create(
        # Body param: Whether contacts are shared across profiles (default: false)
        allow_contact_sharing: nil,
        # Body param: Whether templates are shared across profiles (default: false)
        allow_template_sharing: nil,
        # Body param: Billing contact information for a profile. Required when
        # billing_model is "profile" or "profile_and_organization".
        billing_contact: nil,
        # Body param: Billing model: profile, organization, or profile_and_organization
        # (default: profile).
        #
        # - "organization": the organization's billing details are used; no profile-level
        #   billing info needed.
        # - "profile": the profile is billed independently; billing_contact is required.
        # - "profile_and_organization": the profile is billed first with the organization
        #   as fallback; billing_contact is required.
        billing_model: nil,
        # Body param: Brand and KYC data grouped into contact, business, and compliance
        # sections
        brand: nil,
        # Body param: Profile description (optional)
        description: nil,
        # Body param: Profile icon URL (optional)
        icon: nil,
        # Body param: Whether this profile inherits contacts from organization (default:
        # true)
        inherit_contacts: nil,
        # Body param: Whether this profile inherits TCR brand from organization (default:
        # true)
        inherit_tcr_brand: nil,
        # Body param: Whether this profile inherits TCR campaign from organization
        # (default: true)
        inherit_tcr_campaign: nil,
        # Body param: Whether this profile inherits templates from organization (default:
        # true)
        inherit_templates: nil,
        # Body param: Profile name (required)
        name: nil,
        # Body param: Payment card details for a profile. Accepted when billing_model is
        # "profile" or "profile_and_organization". These details are not stored on our
        # servers and will be forwarded to the payment processor.
        payment_details: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: Profile short name/abbreviation (optional). Must be 3–11 characters,
        # contain only letters, numbers, and spaces, and include at least one letter.
        # Example: "SALES", "Mkt 2", "Support1".
        short_name: nil,
        # Body param: Direct WhatsApp Business Account credentials for a profile. Use this
        # when the profile should have its own WhatsApp Business Account instead of
        # inheriting from the organization. Credentials must be obtained from Meta
        # Business Manager by creating a System User with whatsapp_business_messaging and
        # whatsapp_business_management scopes.
        whatsapp_business_account: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves detailed information about a specific sender profile within an
      # organization, including brand and KYC information if a brand has been
      # configured.
      sig do
        params(
          profile_id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfProfileDetail)
      end
      def retrieve(
        profile_id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Updates a profile's configuration and settings. Requires admin role in the
      # organization. Only provided fields will be updated (partial update).
      #
      # ## Brand Management
      #
      # Include the optional `brand` field to create or update the brand associated with
      # this profile. The brand holds KYC and TCR compliance data (legal business info,
      # contact details, messaging vertical). Once a brand has been submitted to TCR it
      # cannot be modified. Setting `inherit_tcr_brand: true` and providing `brand` in
      # the same request is not allowed.
      #
      # ## Payment Details
      #
      # When `billing_model` is `"profile"` or `"profile_and_organization"` you may
      # include a `payment_details` object containing the card number, expiry (MM/YY),
      # CVC, and billing ZIP code. Payment details are **never stored** on our servers
      # and are forwarded directly to the payment processor. Providing `payment_details`
      # when `billing_model` is `"organization"` is not allowed.
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
        ).returns(Sentdm::APIResponseOfProfileDetail)
      end
      def update(
        # Path param
        profile_id,
        # Body param: Whether contacts are shared across profiles (optional)
        allow_contact_sharing: nil,
        # Body param: Whether number changes are allowed during onboarding (optional)
        allow_number_change_during_onboarding: nil,
        # Body param: Whether templates are shared across profiles (optional)
        allow_template_sharing: nil,
        # Body param: Billing contact information for a profile. Required when
        # billing_model is "profile" or "profile_and_organization".
        billing_contact: nil,
        # Body param: Billing model: profile, organization, or profile_and_organization
        # (optional).
        #
        # - "organization": the organization's billing details are used; no profile-level
        #   billing info needed.
        # - "profile": the profile is billed independently; billing_contact is required.
        # - "profile_and_organization": the profile is billed first with the organization
        #   as fallback; billing_contact is required.
        billing_model: nil,
        # Body param: Brand and KYC data grouped into contact, business, and compliance
        # sections
        brand: nil,
        # Body param: Profile description (optional)
        description: nil,
        # Body param: Profile icon URL (optional)
        icon: nil,
        # Body param: Whether this profile inherits contacts from organization (optional)
        inherit_contacts: nil,
        # Body param: Whether this profile inherits TCR brand from organization (optional)
        inherit_tcr_brand: nil,
        # Body param: Whether this profile inherits TCR campaign from organization
        # (optional)
        inherit_tcr_campaign: nil,
        # Body param: Whether this profile inherits templates from organization (optional)
        inherit_templates: nil,
        # Body param: Profile name (optional)
        name: nil,
        # Body param: Payment card details for a profile. Accepted when billing_model is
        # "profile" or "profile_and_organization". These details are not stored on our
        # servers and will be forwarded to the payment processor.
        payment_details: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: Direct phone number for SMS sending (optional)
        sending_phone_number: nil,
        # Body param: Reference to another profile to use for SMS/Telnyx configuration
        # (optional)
        sending_phone_number_profile_id: nil,
        # Body param: Reference to another profile to use for WhatsApp configuration
        # (optional)
        sending_whatsapp_number_profile_id: nil,
        # Body param: Profile short name/abbreviation (optional). Must be 3–11 characters,
        # contain only letters, numbers, and spaces, and include at least one letter.
        # Example: "SALES", "Mkt 2", "Support1".
        short_name: nil,
        # Body param: Direct phone number for WhatsApp sending (optional)
        whatsapp_phone_number: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves all sender profiles within an organization, including brand
      # information for each profile. Profiles represent different brands, departments,
      # or use cases within an organization, each with their own messaging
      # configuration.
      sig do
        params(
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::ProfileListResponse)
      end
      def list(
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Soft deletes a sender profile. The profile will be marked as deleted but data is
      # retained. Requires admin role in the organization.
      sig do
        params(
          profile_id: String,
          body: Sentdm::ProfileDeleteParams::Body::OrHash,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Path param
        profile_id,
        # Body param: Request to delete a profile
        body:,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Final step in profile compliance workflow. Validates all prerequisites (general
      # data, brand, campaigns), connects profile to Telnyx/WhatsApp, and sets status
      # based on configuration. The process runs in the background and calls the
      # provided webhook URL when finished.
      #
      #                 Prerequisites:
      #                 - Profile must be completed
      #                 - If inheritTcrBrand=false: Profile must have existing brand
      #                 - If inheritTcrBrand=true: Parent must have existing brand
      #                 - If TCR application: Must have at least one campaign (own or inherited)
      #                 - If inheritTcrCampaign=false: Profile should have campaigns
      #                 - If inheritTcrCampaign=true: Parent must have campaigns
      #
      #                 Status Logic:
      #                 - If both SMS and WhatsApp channels are missing → SUBMITTED
      #                 - If TCR application and not inheriting brand/campaigns → SUBMITTED
      #                 - If non-TCR with destination country (IsMain=true) → SUBMITTED
      #                 - Otherwise → COMPLETED
      sig do
        params(
          profile_id: String,
          web_hook_url: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def complete(
        # Path param: Profile ID from route
        profile_id,
        # Body param: Webhook URL to call when profile completion finishes (success or
        # failure)
        web_hook_url:,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
