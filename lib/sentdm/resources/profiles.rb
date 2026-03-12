# frozen_string_literal: true

module Sentdm
  module Resources
    # Manage organization profiles
    class Profiles
      # Manage organization profiles
      # @return [Sentdm::Resources::Profiles::Campaigns]
      attr_reader :campaigns

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileCreateParams} for more details.
      #
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
      #
      # @overload create(allow_contact_sharing: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, payment_details: nil, sandbox: nil, short_name: nil, whatsapp_business_account: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param allow_contact_sharing [Boolean] Body param: Whether contacts are shared across profiles (default: false)
      #
      # @param allow_template_sharing [Boolean] Body param: Whether templates are shared across profiles (default: false)
      #
      # @param billing_contact [Sentdm::Models::BillingContactInfo, nil] Body param: Billing contact information for a profile.
      #
      # @param billing_model [String, nil] Body param: Billing model: profile, organization, or profile_and_organization (d
      #
      # @param brand [Sentdm::Models::BrandsBrandData, nil] Body param: Brand and KYC data grouped into contact, business, and compliance se
      #
      # @param description [String, nil] Body param: Profile description (optional)
      #
      # @param icon [String, nil] Body param: Profile icon URL (optional)
      #
      # @param inherit_contacts [Boolean, nil] Body param: Whether this profile inherits contacts from organization (default: t
      #
      # @param inherit_tcr_brand [Boolean, nil] Body param: Whether this profile inherits TCR brand from organization (default:
      #
      # @param inherit_tcr_campaign [Boolean, nil] Body param: Whether this profile inherits TCR campaign from organization (defaul
      #
      # @param inherit_templates [Boolean, nil] Body param: Whether this profile inherits templates from organization (default:
      #
      # @param name [String] Body param: Profile name (required)
      #
      # @param payment_details [Sentdm::Models::PaymentDetails, nil] Body param: Payment card details for a profile.
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param short_name [String, nil] Body param: Profile short name/abbreviation (optional). Must be 3–11 characters,
      #
      # @param whatsapp_business_account [Sentdm::Models::ProfileCreateParams::WhatsappBusinessAccount, nil] Body param: Direct WhatsApp Business Account credentials for a profile.
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfProfileDetail]
      #
      # @see Sentdm::Models::ProfileCreateParams
      def create(params = {})
        parsed, options = Sentdm::ProfileCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: "v3/profiles",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseOfProfileDetail,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileRetrieveParams} for more details.
      #
      # Retrieves detailed information about a specific sender profile within an
      # organization, including brand and KYC information if a brand has been
      # configured.
      #
      # @overload retrieve(profile_id, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String]
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfProfileDetail]
      #
      # @see Sentdm::Models::ProfileRetrieveParams
      def retrieve(profile_id, params = {})
        parsed, options = Sentdm::ProfileRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/profiles/%1$s", profile_id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfProfileDetail,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileUpdateParams} for more details.
      #
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
      #
      # @overload update(profile_id, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, payment_details: nil, sandbox: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, whatsapp_phone_number: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String] Path param
      #
      # @param allow_contact_sharing [Boolean, nil] Body param: Whether contacts are shared across profiles (optional)
      #
      # @param allow_number_change_during_onboarding [Boolean, nil] Body param: Whether number changes are allowed during onboarding (optional)
      #
      # @param allow_template_sharing [Boolean, nil] Body param: Whether templates are shared across profiles (optional)
      #
      # @param billing_contact [Sentdm::Models::BillingContactInfo, nil] Body param: Billing contact information for a profile.
      #
      # @param billing_model [String, nil] Body param: Billing model: profile, organization, or profile_and_organization (o
      #
      # @param brand [Sentdm::Models::BrandsBrandData, nil] Body param: Brand and KYC data grouped into contact, business, and compliance se
      #
      # @param description [String, nil] Body param: Profile description (optional)
      #
      # @param icon [String, nil] Body param: Profile icon URL (optional)
      #
      # @param inherit_contacts [Boolean, nil] Body param: Whether this profile inherits contacts from organization (optional)
      #
      # @param inherit_tcr_brand [Boolean, nil] Body param: Whether this profile inherits TCR brand from organization (optional)
      #
      # @param inherit_tcr_campaign [Boolean, nil] Body param: Whether this profile inherits TCR campaign from organization (option
      #
      # @param inherit_templates [Boolean, nil] Body param: Whether this profile inherits templates from organization (optional)
      #
      # @param name [String, nil] Body param: Profile name (optional)
      #
      # @param payment_details [Sentdm::Models::PaymentDetails, nil] Body param: Payment card details for a profile.
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param sending_phone_number [String, nil] Body param: Direct phone number for SMS sending (optional)
      #
      # @param sending_phone_number_profile_id [String, nil] Body param: Reference to another profile to use for SMS/Telnyx configuration (op
      #
      # @param sending_whatsapp_number_profile_id [String, nil] Body param: Reference to another profile to use for WhatsApp configuration (opti
      #
      # @param short_name [String, nil] Body param: Profile short name/abbreviation (optional). Must be 3–11 characters,
      #
      # @param whatsapp_phone_number [String, nil] Body param: Direct phone number for WhatsApp sending (optional)
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfProfileDetail]
      #
      # @see Sentdm::Models::ProfileUpdateParams
      def update(profile_id, params = {})
        parsed, options = Sentdm::ProfileUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :patch,
          path: ["v3/profiles/%1$s", profile_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseOfProfileDetail,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileListParams} for more details.
      #
      # Retrieves all sender profiles within an organization, including brand
      # information for each profile. Profiles represent different brands, departments,
      # or use cases within an organization, each with their own messaging
      # configuration.
      #
      # @overload list(x_profile_id: nil, request_options: {})
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::ProfileListResponse]
      #
      # @see Sentdm::Models::ProfileListParams
      def list(params = {})
        parsed, options = Sentdm::ProfileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/profiles",
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::ProfileListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileDeleteParams} for more details.
      #
      # Soft deletes a sender profile. The profile will be marked as deleted but data is
      # retained. Requires admin role in the organization.
      #
      # @overload delete(profile_id, body:, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String] Path param
      #
      # @param body [Sentdm::Models::ProfileDeleteParams::Body] Body param: Request to delete a profile
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::ProfileDeleteParams
      def delete(profile_id, params)
        parsed, options = Sentdm::ProfileDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/profiles/%1$s", profile_id],
          headers: parsed.except(:body).transform_keys(x_profile_id: "x-profile-id"),
          body: parsed[:body],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileCompleteParams} for more details.
      #
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
      #
      # @overload complete(profile_id, web_hook_url:, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String] Path param: Profile ID from route
      #
      # @param web_hook_url [String] Body param: Webhook URL to call when profile completion finishes (success or fai
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Sentdm::Models::ProfileCompleteParams
      def complete(profile_id, params)
        parsed, options = Sentdm::ProfileCompleteParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: ["v3/profiles/%1$s/complete", profile_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::Internal::Type::Unknown,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
        @campaigns = Sentdm::Resources::Profiles::Campaigns.new(client: client)
      end
    end
  end
end
