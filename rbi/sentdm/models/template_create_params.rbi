# typed: strong

module Sentdm
  module Models
    class TemplateCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateCreateParams, Sentdm::Internal::AnyHash)
        end

      # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
      # if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Source of template creation (default: from-api)
      sig { returns(T.nilable(String)) }
      attr_accessor :creation_source

      # Template definition including header, body, footer, and buttons
      sig { returns(T.nilable(Sentdm::TemplateDefinition)) }
      attr_reader :definition

      sig { params(definition: Sentdm::TemplateDefinition::OrHash).void }
      attr_writer :definition

      # Template language code (e.g., en_US) (optional, auto-detected if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :language

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Whether to submit the template for review after creation (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submit_for_review

      sig { params(submit_for_review: T::Boolean).void }
      attr_writer :submit_for_review

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          category: T.nilable(String),
          creation_source: T.nilable(String),
          definition: Sentdm::TemplateDefinition::OrHash,
          language: T.nilable(String),
          sandbox: T::Boolean,
          submit_for_review: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
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
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Whether to submit the template for review after creation (default: false)
        submit_for_review: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            category: T.nilable(String),
            creation_source: T.nilable(String),
            definition: Sentdm::TemplateDefinition,
            language: T.nilable(String),
            sandbox: T::Boolean,
            submit_for_review: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
