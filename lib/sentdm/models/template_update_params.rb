# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#update
    class TemplateUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute category
      #   Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute definition
      #   Template definition including header, body, footer, and buttons
      #
      #   @return [Sentdm::Models::TemplateDefinition, nil]
      optional :definition, -> { Sentdm::TemplateDefinition }, nil?: true

      # @!attribute language
      #   Template language code (e.g., en_US)
      #
      #   @return [String, nil]
      optional :language, String, nil?: true

      # @!attribute name
      #   Template display name
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute submit_for_review
      #   Whether to submit the template for review after updating (default: false)
      #
      #   @return [Boolean, nil]
      optional :submit_for_review, Sentdm::Internal::Type::Boolean

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(category: nil, definition: nil, language: nil, name: nil, submit_for_review: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateUpdateParams} for more details.
      #
      #   @param category [String, nil] Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param definition [Sentdm::Models::TemplateDefinition, nil] Template definition including header, body, footer, and buttons
      #
      #   @param language [String, nil] Template language code (e.g., en_US)
      #
      #   @param name [String, nil] Template display name
      #
      #   @param submit_for_review [Boolean] Whether to submit the template for review after updating (default: false)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
