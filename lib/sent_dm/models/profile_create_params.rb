# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Profiles#create
    class ProfileCreateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute allow_contact_sharing
      #   Whether contacts are shared across profiles (default: false)
      #
      #   @return [Boolean, nil]
      optional :allow_contact_sharing, SentDm::Internal::Type::Boolean

      # @!attribute allow_template_sharing
      #   Whether templates are shared across profiles (default: false)
      #
      #   @return [Boolean, nil]
      optional :allow_template_sharing, SentDm::Internal::Type::Boolean

      # @!attribute billing_model
      #   Billing model: profile, organization, or profile_and_organization (default:
      #   profile)
      #
      #   @return [String, nil]
      optional :billing_model, String, nil?: true

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
      #   Whether this profile inherits contacts from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_contacts, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_brand
      #   Whether this profile inherits TCR brand from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_brand, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_tcr_campaign
      #   Whether this profile inherits TCR campaign from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_tcr_campaign, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute inherit_templates
      #   Whether this profile inherits templates from organization (default: true)
      #
      #   @return [Boolean, nil]
      optional :inherit_templates, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute name
      #   Profile name (required)
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute short_name
      #   Profile short name/abbreviation (optional)
      #
      #   @return [String, nil]
      optional :short_name, String, nil?: true

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(allow_contact_sharing: nil, allow_template_sharing: nil, billing_model: nil, description: nil, icon: nil, inherit_contacts: nil, inherit_tcr_brand: nil, inherit_tcr_campaign: nil, inherit_templates: nil, name: nil, short_name: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::ProfileCreateParams} for more details.
      #
      #   @param allow_contact_sharing [Boolean] Whether contacts are shared across profiles (default: false)
      #
      #   @param allow_template_sharing [Boolean] Whether templates are shared across profiles (default: false)
      #
      #   @param billing_model [String, nil] Billing model: profile, organization, or profile_and_organization (default: prof
      #
      #   @param description [String, nil] Profile description (optional)
      #
      #   @param icon [String, nil] Profile icon URL (optional)
      #
      #   @param inherit_contacts [Boolean, nil] Whether this profile inherits contacts from organization (default: true)
      #
      #   @param inherit_tcr_brand [Boolean, nil] Whether this profile inherits TCR brand from organization (default: true)
      #
      #   @param inherit_tcr_campaign [Boolean, nil] Whether this profile inherits TCR campaign from organization (default: true)
      #
      #   @param inherit_templates [Boolean, nil] Whether this profile inherits templates from organization (default: true)
      #
      #   @param name [String] Profile name (required)
      #
      #   @param short_name [String, nil] Profile short name/abbreviation (optional)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
