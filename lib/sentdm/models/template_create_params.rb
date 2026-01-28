# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#create
    class TemplateCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute definition
      #   Template definition containing header, body, footer, and buttons
      #
      #   @return [Sentdm::Models::TemplateDefinition]
      required :definition, -> { Sentdm::TemplateDefinition }

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
      optional :submit_for_review, Sentdm::Internal::Type::Boolean, api_name: :submitForReview

      # @!method initialize(definition:, category: nil, language: nil, submit_for_review: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateCreateParams} for more details.
      #
      #   @param definition [Sentdm::Models::TemplateDefinition] Template definition containing header, body, footer, and buttons
      #
      #   @param category [String, nil] The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Can only be se
      #
      #   @param language [String, nil] The template language code (e.g., en_US, es_ES). Can only be set when creating a
      #
      #   @param submit_for_review [Boolean] When false, the template will be saved as draft.
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
