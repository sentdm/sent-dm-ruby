# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Templates#create
    class TemplateCreateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute definition
      #   Template definition containing header, body, footer, and buttons
      #
      #   @return [SentDm::Models::TemplateDefinition]
      required :definition, -> { SentDm::TemplateDefinition }

      # @!attribute x_api_key
      #
      #   @return [String]
      required :x_api_key, String

      # @!attribute x_sender_id
      #
      #   @return [String]
      required :x_sender_id, String

      # @!attribute category
      #   The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Can only be
      #   set when creating a new template. If not provided, will be auto-generated using
      #   AI.
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute language
      #   The template language code (e.g., en_US, es_ES). Can only be set when creating a
      #   new template. If not provided, will be auto-detected using AI.
      #
      #   @return [String, nil]
      optional :language, String, nil?: true

      # @!attribute submit_for_review
      #   When false, the template will be saved as draft. When true, the template will be
      #   submitted for review.
      #
      #   @return [Boolean, nil]
      optional :submit_for_review, SentDm::Internal::Type::Boolean, api_name: :submitForReview

      # @!method initialize(definition:, x_api_key:, x_sender_id:, category: nil, language: nil, submit_for_review: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::TemplateCreateParams} for more details.
      #
      #   @param definition [SentDm::Models::TemplateDefinition] Template definition containing header, body, footer, and buttons
      #
      #   @param x_api_key [String]
      #
      #   @param x_sender_id [String]
      #
      #   @param category [String, nil] The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Can only be se
      #
      #   @param language [String, nil] The template language code (e.g., en_US, es_ES). Can only be set when creating a
      #
      #   @param submit_for_review [Boolean] When false, the template will be saved as draft.
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
