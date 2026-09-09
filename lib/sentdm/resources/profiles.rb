# frozen_string_literal: true

module Sentdm
  module Resources
    # **Deprecated — use Sender Profiles.**
    #
    # The original profile resource, kept because it has live callers. It still works,
    # and its replacement is `/v3/sender-profiles`, which takes the identity and the
    # campaign in one call instead of across three.
    #
    # New integrations should not start here.
    class Profiles
      # **Deprecated — use Sender Profiles.**
      #
      # The original profile resource, kept because it has live callers. It still works,
      # and its replacement is `/v3/sender-profiles`, which takes the identity and the
      # campaign in one call instead of across three.
      #
      # New integrations should not start here.
      # @return [Sentdm::Resources::Profiles::Campaigns]
      attr_reader :campaigns

      # @deprecated
      #
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileCreateParams} for more details.
      #
      # **Deprecated.** This endpoint is replaced by `/v3/sender-profiles` and will be
      # removed in a future release. It still behaves exactly as before, so nothing
      # needs to change today — but new integrations should use `/v3/sender-profiles`,
      # which models a profile's markets, compliance, brand, campaigns and billing
      # explicitly.
      #
      # Creates a new sender profile within an organization. Profiles represent
      # different brands, departments, or use cases, each with their own messaging
      # configuration and settings. Requires admin role in the organization.
      #
      # ## WhatsApp Business Account
      #
      # Every profile owns its own WhatsApp Business Account — accounts are never shared
      # between profiles or inherited from the organization. Provide a
      # `whatsapp_business_account` object with `waba_id`, `phone_number_id`, and
      # `access_token`. Obtain these from Meta Business Manager by creating a System
      # User with `whatsapp_business_messaging` and `whatsapp_business_management`
      # permissions.
      #
      # Omit the field and the profile is created without WhatsApp, staying incomplete
      # until it has an account of its own.
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
      # @param allow_contact_sharing [Boolean, nil] Body param: Deprecated. Accepted and ignored. Contact and template sharing betwe
      #
      # @param allow_template_sharing [Boolean, nil] Body param
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
      # @param inherit_contacts [Boolean, nil] Body param
      #
      # @param inherit_tcr_brand [Boolean, nil] Body param: Whether this profile inherits TCR brand from organization (default:
      #
      # @param inherit_tcr_campaign [Boolean, nil] Body param: Whether this profile inherits TCR campaign from organization (defaul
      #
      # @param inherit_templates [Boolean, nil] Body param
      #
      # @param name [String] Body param: Profile name (required)
      #
      # @param payment_details [Sentdm::Models::PaymentDetails, nil] Body param: Payment card details for this profile (optional).
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

      # @deprecated
      #
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileRetrieveParams} for more details.
      #
      # **Deprecated.** This endpoint is replaced by `/v3/sender-profiles` and will be
      # removed in a future release. It still behaves exactly as before, so nothing
      # needs to change today — but new integrations should use `/v3/sender-profiles`,
      # which models a profile's markets, compliance, brand, campaigns and billing
      # explicitly.
      #
      # Retrieves detailed information about a specific sender profile within an
      # organization, including brand and KYC information if a brand has been
      # configured.
      #
      # @overload retrieve(profile_id, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String] Profile ID from route parameter
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

      # @deprecated
      #
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileUpdateParams} for more details.
      #
      # **Deprecated.** This endpoint is replaced by `/v3/sender-profiles` and will be
      # removed in a future release. It still behaves exactly as before, so nothing
      # needs to change today — but new integrations should use `/v3/sender-profiles`,
      # which models a profile's markets, compliance, brand, campaigns and billing
      # explicitly.
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
      # ## Deprecated fields
      #
      # `sending_phone_number_profile_id` and `sending_whatsapp_number_profile_id` are
      # **accepted and ignored**. Sender borrowing is gone: a profile cannot send from
      # another profile's number, because two profiles behind one sender makes an
      # inbound reply and a delivery receipt ambiguous about whose they are.
      #
      # Sending either **changes nothing and still returns `200`** — they are kept on
      # the contract so an existing integration keeps working. Reads carry both keys too
      # and always answer `null`, which is how you can confirm the value did not take.
      #
      # Give the profile a sender of its own instead — `POST /v3/channels/sms` or
      # `POST /v3/channels/whatsapp`, sent with the `x-profile-id` header naming it.
      #
      # @overload update(profile_id, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_contact: nil, billing_model: nil, brand: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, payment_details: nil, sandbox: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, whatsapp_phone_number: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String] Path param: Profile ID from route parameter
      #
      # @param allow_contact_sharing [Boolean, nil] Body param: Deprecated. Accepted and ignored. Contact and template sharing betwe
      #
      # @param allow_number_change_during_onboarding [Boolean, nil] Body param: Whether number changes are allowed during onboarding (optional)
      #
      # @param allow_template_sharing [Boolean, nil] Body param
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
      # @param inherit_contacts [Boolean, nil] Body param
      #
      # @param inherit_tcr_brand [Boolean, nil] Body param: Whether this profile inherits TCR brand from organization (optional)
      #
      # @param inherit_tcr_campaign [Boolean, nil] Body param: Whether this profile inherits TCR campaign from organization (option
      #
      # @param inherit_templates [Boolean, nil] Body param
      #
      # @param name [String, nil] Body param: Profile name (optional)
      #
      # @param payment_details [Sentdm::Models::PaymentDetails, nil] Body param: Payment card details for this profile (optional).
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param sending_phone_number [String, nil] Body param: Direct phone number for SMS sending (optional)
      #
      # @param sending_phone_number_profile_id [String, nil] Body param: Deprecated. Accepted and ignored. Sender borrowing is gone: a profil
      #
      # @param sending_whatsapp_number_profile_id [String, nil] Body param
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

      # @deprecated
      #
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileListParams} for more details.
      #
      # **Deprecated.** This endpoint is replaced by `/v3/sender-profiles` and will be
      # removed in a future release. It still behaves exactly as before, so nothing
      # needs to change today — but new integrations should use `/v3/sender-profiles`,
      # which models a profile's markets, compliance, brand, campaigns and billing
      # explicitly.
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

      # @deprecated
      #
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileDeleteParams} for more details.
      #
      # **Deprecated.** This endpoint is replaced by `/v3/sender-profiles` and will be
      # removed in a future release. It still behaves exactly as before, so nothing
      # needs to change today — but new integrations should use `/v3/sender-profiles`,
      # which models a profile's markets, compliance, brand, campaigns and billing
      # explicitly.
      #
      # Soft deletes a sender profile. The profile will be marked as deleted but data is
      # retained. Anything it still held is released first: phone numbers return to our
      # inventory and can go to whoever asks next, its own WhatsApp account is
      # deregistered, and its routing rules stop being used. Requires admin role in the
      # organization.
      #
      # @overload delete(profile_id, sandbox: nil, x_profile_id: nil, request_options: {})
      #
      # @param profile_id [String] Path param: Profile ID from route parameter
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::ProfileDeleteParams
      def delete(profile_id, params = {})
        parsed, options = Sentdm::ProfileDeleteParams.dump_request(params)
        header_params = {x_profile_id: "x-profile-id"}
        @client.request(
          method: :delete,
          path: ["v3/profiles/%1$s", profile_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: NilClass,
          options: options
        )
      end

      # @deprecated
      #
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ProfileCompleteParams} for more details.
      #
      # **Deprecated.** This endpoint is replaced by `/v3/sender-profiles` and will be
      # removed in a future release. It still behaves exactly as before, so nothing
      # needs to change today — but new integrations should use `/v3/sender-profiles`,
      # which models a profile's markets, compliance, brand, campaigns and billing
      # explicitly.
      #
      # Final step in the profile compliance workflow. Validates all prerequisites (KYC,
      # brand, campaigns, required documents), connects the profile to the SMS and
      # WhatsApp channels, and marks it onboarded. Prerequisites are always validated
      # first: if any fail the call returns 400 naming every unmet one, and nothing is
      # started. If they pass and the profile is already onboarded, the call returns 200
      # and does nothing. Otherwise it returns 202 and calls the provided webhook URL
      # when background processing finishes.
      #
      # Callable with the organization's API key or the profile's own key. The key's
      # user must be an admin or owner of the profile, or of the organization it belongs
      # to.
      #
      # Prerequisites (all but the last are checked before the already-onboarded
      # short-circuit, matching the previous contract; the last is checked after it, so
      # a profile that is already onboarded is never rejected by it):
      #
      # - Profile must have a name, short name, and description (short name max 50
      #   characters, description max 5000)
      # - webHookUrl must be supplied on the request
      # - A KYC form submission is required
      # - A brand is required, either on the profile or inherited from the parent
      #   organization
      # - TCR applications must have at least one campaign, own or inherited
      # - Destination countries marked as main must have their required compliance
      #   documents uploaded
      # - TCR applications must state whether they inherit the organization's TCR brand
      #   and campaign
      #
      # Outcome:
      #
      # - Once the prerequisites pass and background processing succeeds, the profile's
      #   conversionFlowStatus becomes ONBOARDED and its public status reads `approved`
      # - A profile with no WhatsApp channel, or one still awaiting TCR registration or
      #   country documents, is onboarded like any other. Those are answered by the
      #   brand and campaign records, not by a status on the profile
      # - If background processing fails, the profile keeps the status it already had
      #   and the webhook reports the reason
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
      # @return [Sentdm::Models::ProfileCompleteResponse]
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
          model: Sentdm::Models::ProfileCompleteResponse,
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
