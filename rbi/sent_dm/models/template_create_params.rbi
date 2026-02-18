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

      # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
      # if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Source of template creation (default: from-api)
      sig { returns(T.nilable(String)) }
      attr_accessor :creation_source

      # Template definition including header, body, footer, and buttons
      sig { returns(T.nilable(SentDm::TemplateDefinition)) }
      attr_reader :definition

      sig { params(definition: SentDm::TemplateDefinition::OrHash).void }
      attr_writer :definition

      # Template language code (e.g., en_US) (optional, auto-detected if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :language

      # Whether to submit the template for review after creation (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submit_for_review

      sig { params(submit_for_review: T::Boolean).void }
      attr_writer :submit_for_review

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          category: T.nilable(String),
          creation_source: T.nilable(String),
          definition: SentDm::TemplateDefinition::OrHash,
          language: T.nilable(String),
          submit_for_review: T::Boolean,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
        # if not provided)
        category: nil,
        # Source of template creation (default: from-api)
        creation_source: nil,
        # Template definition including header, body, footer, and buttons
        definition: nil,
        # Template language code (e.g., en_US) (optional, auto-detected if not provided)
        language: nil,
        # Whether to submit the template for review after creation (default: false)
        submit_for_review: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: T.nilable(String),
            creation_source: T.nilable(String),
            definition: SentDm::TemplateDefinition,
            language: T.nilable(String),
            submit_for_review: T::Boolean,
            test_mode: T::Boolean,
            idempotency_key: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
