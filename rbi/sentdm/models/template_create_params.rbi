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

      # Create this template automatically on every sender profile of the organization,
      # now and in future (default: false). Accepted only from an organization that has
      # been enabled for it, and only at creation — it cannot be changed afterwards.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :auto_create_for_sp

      sig { params(auto_create_for_sp: T::Boolean).void }
      attr_writer :auto_create_for_sp

      # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
      # if not provided)
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Source of template creation (default: from-api)
      sig { returns(T.nilable(String)) }
      attr_accessor :creation_source

      # Complete definition of a message template including header, body, footer, and
      # buttons
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
          auto_create_for_sp: T::Boolean,
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
        # Create this template automatically on every sender profile of the organization,
        # now and in future (default: false). Accepted only from an organization that has
        # been enabled for it, and only at creation — it cannot be changed afterwards.
        auto_create_for_sp: nil,
        # Template category: MARKETING, UTILITY, AUTHENTICATION (optional, auto-detected
        # if not provided)
        category: nil,
        # Source of template creation (default: from-api)
        creation_source: nil,
        # Complete definition of a message template including header, body, footer, and
        # buttons
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
            auto_create_for_sp: T::Boolean,
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
