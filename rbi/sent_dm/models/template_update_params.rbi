# typed: strong

module SentDm
  module Models
    class TemplateUpdateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateUpdateParams, SentDm::Internal::AnyHash)
        end

      # Template category: MARKETING, UTILITY, AUTHENTICATION
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Template definition including header, body, footer, and buttons
      sig { returns(T.nilable(SentDm::TemplateDefinition)) }
      attr_reader :definition

      sig do
        params(definition: T.nilable(SentDm::TemplateDefinition::OrHash)).void
      end
      attr_writer :definition

      # Template language code (e.g., en_US)
      sig { returns(T.nilable(String)) }
      attr_accessor :language

      # Template display name
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Whether to submit the template for review after updating (default: false)
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
          definition: T.nilable(SentDm::TemplateDefinition::OrHash),
          language: T.nilable(String),
          name: T.nilable(String),
          submit_for_review: T::Boolean,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Template category: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Template definition including header, body, footer, and buttons
        definition: nil,
        # Template language code (e.g., en_US)
        language: nil,
        # Template display name
        name: nil,
        # Whether to submit the template for review after updating (default: false)
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
            definition: T.nilable(SentDm::TemplateDefinition),
            language: T.nilable(String),
            name: T.nilable(String),
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
