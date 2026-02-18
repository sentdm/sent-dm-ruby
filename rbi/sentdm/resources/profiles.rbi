# typed: strong

module Sentdm
  module Resources
    class Profiles
      # Creates a new sender profile within an organization. Profiles represent
      # different brands, departments, or use cases, each with their own messaging
      # configuration and settings. Requires admin role in the organization.
      sig do
        params(
          allow_contact_sharing: T::Boolean,
          allow_template_sharing: T::Boolean,
          billing_model: T.nilable(String),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: String,
          short_name: T.nilable(String),
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfProfileDetail)
      end
      def create(
        # Body param: Whether contacts are shared across profiles (default: false)
        allow_contact_sharing: nil,
        # Body param: Whether templates are shared across profiles (default: false)
        allow_template_sharing: nil,
        # Body param: Billing model: profile, organization, or profile_and_organization
        # (default: profile)
        billing_model: nil,
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
        # Body param: Profile short name/abbreviation (optional)
        short_name: nil,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Retrieves detailed information about a specific sender profile within an
      # organization.
      sig do
        params(
          profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfProfileDetail)
      end
      def retrieve(profile_id, request_options: {})
      end

      # Updates a profile's configuration and settings. Requires admin role in the
      # organization. Only provided fields will be updated (partial update).
      sig do
        params(
          path_profile_id: String,
          allow_contact_sharing: T.nilable(T::Boolean),
          allow_number_change_during_onboarding: T.nilable(T::Boolean),
          allow_template_sharing: T.nilable(T::Boolean),
          billing_model: T.nilable(String),
          description: T.nilable(String),
          icon: T.nilable(String),
          inherit_contacts: T.nilable(T::Boolean),
          inherit_tcr_brand: T.nilable(T::Boolean),
          inherit_tcr_campaign: T.nilable(T::Boolean),
          inherit_templates: T.nilable(T::Boolean),
          name: T.nilable(String),
          body_profile_id: String,
          sending_phone_number: T.nilable(String),
          sending_phone_number_profile_id: T.nilable(String),
          sending_whatsapp_number_profile_id: T.nilable(String),
          short_name: T.nilable(String),
          test_mode: T::Boolean,
          whatsapp_phone_number: T.nilable(String),
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseOfProfileDetail)
      end
      def update(
        # Path param
        path_profile_id,
        # Body param: Whether contacts are shared across profiles (optional)
        allow_contact_sharing: nil,
        # Body param: Whether number changes are allowed during onboarding (optional)
        allow_number_change_during_onboarding: nil,
        # Body param: Whether templates are shared across profiles (optional)
        allow_template_sharing: nil,
        # Body param: Billing model: profile, organization, or profile_and_organization
        # (optional)
        billing_model: nil,
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
        # Body param: Profile ID from route parameter
        body_profile_id: nil,
        # Body param: Direct phone number for SMS sending (optional)
        sending_phone_number: nil,
        # Body param: Reference to another profile to use for SMS/Telnyx configuration
        # (optional)
        sending_phone_number_profile_id: nil,
        # Body param: Reference to another profile to use for WhatsApp configuration
        # (optional)
        sending_whatsapp_number_profile_id: nil,
        # Body param: Profile short name/abbreviation (optional)
        short_name: nil,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Body param: Direct phone number for WhatsApp sending (optional)
        whatsapp_phone_number: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Retrieves all sender profiles within an organization. Profiles represent
      # different brands, departments, or use cases within an organization, each with
      # their own messaging configuration.
      sig do
        params(request_options: Sentdm::RequestOptions::OrHash).returns(
          Sentdm::Models::ProfileListResponse
        )
      end
      def list(request_options: {})
      end

      # Soft deletes a sender profile. The profile will be marked as deleted but data is
      # retained. Requires admin role in the organization.
      sig do
        params(
          path_profile_id: String,
          body_profile_id: String,
          test_mode: T::Boolean,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def delete(
        path_profile_id,
        # Profile ID from route parameter
        body_profile_id: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
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
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def complete(
        # Path param: Profile ID from route
        profile_id,
        # Body param: Webhook URL to call when profile completion finishes (success or
        # failure)
        web_hook_url:,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
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
