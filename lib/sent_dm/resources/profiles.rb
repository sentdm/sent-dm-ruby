# frozen_string_literal: true

module SentDm
  module Resources
    class Profiles
      # Some parameter documentations has been truncated, see
      # {SentDm::Models::ProfileCreateParams} for more details.
      #
      # Creates a new sender profile within an organization. Profiles represent
      # different brands, departments, or use cases, each with their own messaging
      # configuration and settings. Requires admin role in the organization.
      #
      # @overload create(allow_contact_sharing: nil, allow_template_sharing: nil, billing_model: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, short_name: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param allow_contact_sharing [Boolean] Body param: Whether contacts are shared across profiles (default: false)
      #
      # @param allow_template_sharing [Boolean] Body param: Whether templates are shared across profiles (default: false)
      #
      # @param billing_model [String, nil] Body param: Billing model: profile, organization, or profile_and_organization (d
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
      # @param short_name [String, nil] Body param: Profile short name/abbreviation (optional)
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseOfProfileDetail]
      #
      # @see SentDm::Models::ProfileCreateParams
      def create(params = {})
        parsed, options = SentDm::ProfileCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "v3/profiles",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseOfProfileDetail,
          options: options
        )
      end

      # Retrieves detailed information about a specific sender profile within an
      # organization.
      #
      # @overload retrieve(profile_id, request_options: {})
      #
      # @param profile_id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseOfProfileDetail]
      #
      # @see SentDm::Models::ProfileRetrieveParams
      def retrieve(profile_id, params = {})
        @client.request(
          method: :get,
          path: ["v3/profiles/%1$s", profile_id],
          model: SentDm::APIResponseOfProfileDetail,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::ProfileUpdateParams} for more details.
      #
      # Updates a profile's configuration and settings. Requires admin role in the
      # organization. Only provided fields will be updated (partial update).
      #
      # @overload update(path_profile_id, allow_contact_sharing: nil, allow_number_change_during_onboarding: nil, allow_template_sharing: nil, billing_model: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, body_profile_id: nil, sending_phone_number: nil, sending_phone_number_profile_id: nil, sending_whatsapp_number_profile_id: nil, short_name: nil, test_mode: nil, whatsapp_phone_number: nil, idempotency_key: nil, request_options: {})
      #
      # @param path_profile_id [String] Path param
      #
      # @param allow_contact_sharing [Boolean, nil] Body param: Whether contacts are shared across profiles (optional)
      #
      # @param allow_number_change_during_onboarding [Boolean, nil] Body param: Whether number changes are allowed during onboarding (optional)
      #
      # @param allow_template_sharing [Boolean, nil] Body param: Whether templates are shared across profiles (optional)
      #
      # @param billing_model [String, nil] Body param: Billing model: profile, organization, or profile_and_organization (o
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
      # @param body_profile_id [String] Body param: Profile ID from route parameter
      #
      # @param sending_phone_number [String, nil] Body param: Direct phone number for SMS sending (optional)
      #
      # @param sending_phone_number_profile_id [String, nil] Body param: Reference to another profile to use for SMS/Telnyx configuration (op
      #
      # @param sending_whatsapp_number_profile_id [String, nil] Body param: Reference to another profile to use for WhatsApp configuration (opti
      #
      # @param short_name [String, nil] Body param: Profile short name/abbreviation (optional)
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param whatsapp_phone_number [String, nil] Body param: Direct phone number for WhatsApp sending (optional)
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseOfProfileDetail]
      #
      # @see SentDm::Models::ProfileUpdateParams
      def update(path_profile_id, params = {})
        parsed, options = SentDm::ProfileUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :patch,
          path: ["v3/profiles/%1$s", path_profile_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseOfProfileDetail,
          options: options
        )
      end

      # Retrieves all sender profiles within an organization. Profiles represent
      # different brands, departments, or use cases within an organization, each with
      # their own messaging configuration.
      #
      # @overload list(request_options: {})
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::ProfileListResponse]
      #
      # @see SentDm::Models::ProfileListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v3/profiles",
          model: SentDm::Models::ProfileListResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::ProfileDeleteParams} for more details.
      #
      # Soft deletes a sender profile. The profile will be marked as deleted but data is
      # retained. Requires admin role in the organization.
      #
      # @overload delete(path_profile_id, body_profile_id: nil, test_mode: nil, request_options: {})
      #
      # @param path_profile_id [String]
      #
      # @param body_profile_id [String] Profile ID from route parameter
      #
      # @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::ProfileDeleteParams
      def delete(path_profile_id, params = {})
        parsed, options = SentDm::ProfileDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/profiles/%1$s", path_profile_id],
          headers: {"content-type" => "*/*"},
          body: parsed,
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::ProfileCompleteParams} for more details.
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
      # @overload complete(profile_id, web_hook_url:, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param profile_id [String] Path param: Profile ID from route
      #
      # @param web_hook_url [String] Body param: Webhook URL to call when profile completion finishes (success or fai
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see SentDm::Models::ProfileCompleteParams
      def complete(profile_id, params)
        parsed, options = SentDm::ProfileCompleteParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: ["v3/profiles/%1$s/complete", profile_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::Internal::Type::Unknown,
          options: options
        )
      end

      # @api private
      #
      # @param client [SentDm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
