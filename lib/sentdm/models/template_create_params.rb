# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#create
    class TemplateCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute category
      #   Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
      #   if not provided)
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute creation_source
      #   Source of template creation (default: from-api)
      #
      #   @return [String, nil]
      optional :creation_source, String, nil?: true

      # @!attribute definition
      #   Template definition including header, body, footer, and buttons
      #
      #   @return [Sentdm::Models::TemplateDefinition, nil]
      optional :definition, -> { Sentdm::TemplateDefinition }

      # @!attribute language
      #   Template language code (e.g., en_US) (optional, auto-detected if not provided)
      #
      #   @return [String, nil]
      optional :language, String, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute submit_for_review
      #   Whether to submit the template for review after creation (default: false)
      #
      #   @return [Boolean, nil]
      optional :submit_for_review, Sentdm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(category: nil, creation_source: nil, definition: nil, language: nil, sandbox: nil, submit_for_review: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateCreateParams} for more details.
      #
      #   @param category [String, nil] Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected i
      #
      #   @param creation_source [String, nil] Source of template creation (default: from-api)
      #
      #   @param definition [Sentdm::Models::TemplateDefinition] Template definition including header, body, footer, and buttons
      #
      #   @param language [String, nil] Template language code (e.g., en_US) (optional, auto-detected if not provided)
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param submit_for_review [Boolean] Whether to submit the template for review after creation (default: false)
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
