# typed: strong

module SentDm
  module Models
    class TemplateCreateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateCreateParams, SentDm::Internal::AnyHash)
        end

      # Template definition containing header, body, footer, and buttons
      sig { returns(SentDm::TemplateDefinition) }
      attr_reader :definition

      sig { params(definition: SentDm::TemplateDefinition::OrHash).void }
      attr_writer :definition

      # The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Can only be
      # set when creating a new template. If not provided, will be auto-generated using
      # AI.
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # The template language code (e.g., en_US, es_ES). Can only be set when creating a
      # new template. If not provided, will be auto-detected using AI.
      sig { returns(T.nilable(String)) }
      attr_accessor :language

      # When false, the template will be saved as draft. When true, the template will be
      # submitted for review.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submit_for_review

      sig { params(submit_for_review: T::Boolean).void }
      attr_writer :submit_for_review

      sig do
        params(
          definition: SentDm::TemplateDefinition::OrHash,
          category: T.nilable(String),
          language: T.nilable(String),
          submit_for_review: T::Boolean,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Template definition containing header, body, footer, and buttons
        definition:,
        # The template category (e.g., MARKETING, UTILITY, AUTHENTICATION). Can only be
        # set when creating a new template. If not provided, will be auto-generated using
        # AI.
        category: nil,
        # The template language code (e.g., en_US, es_ES). Can only be set when creating a
        # new template. If not provided, will be auto-detected using AI.
        language: nil,
        # When false, the template will be saved as draft. When true, the template will be
        # submitted for review.
        submit_for_review: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            definition: SentDm::TemplateDefinition,
            category: T.nilable(String),
            language: T.nilable(String),
            submit_for_review: T::Boolean,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
