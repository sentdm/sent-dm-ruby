# typed: strong

module Sentdm
  module Models
    class TemplateUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateUpdateParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # API key from the x-api-key header, or empty when the caller sent it as
      # Authorization: Bearer instead.
      #
      # Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
      # header, and [FromHeader] is required by default, so a Bearer-only request would
      # authenticate and then be refused with a 400 for a header it never needed.
      # Endpoints read the customer from the CustomerId claim, not from this value.
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # Template category: MARKETING, UTILITY, AUTHENTICATION
      sig { returns(T.nilable(String)) }
      attr_accessor :category

      # Complete definition of a message template including header, body, footer, and
      # buttons
      sig { returns(T.nilable(Sentdm::TemplateDefinition)) }
      attr_reader :definition

      sig do
        params(definition: T.nilable(Sentdm::TemplateDefinition::OrHash)).void
      end
      attr_writer :definition

      # Template language code (e.g., en_US)
      sig { returns(T.nilable(String)) }
      attr_accessor :language

      # Template display name
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      # Whether to submit the template for review after updating (default: false)
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
          id: String,
          api_key: String,
          category: T.nilable(String),
          definition: T.nilable(Sentdm::TemplateDefinition::OrHash),
          language: T.nilable(String),
          name: T.nilable(String),
          sandbox: T::Boolean,
          submit_for_review: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # API key from the x-api-key header, or empty when the caller sent it as
        # Authorization: Bearer instead.
        #
        # Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
        # header, and [FromHeader] is required by default, so a Bearer-only request would
        # authenticate and then be refused with a 400 for a header it never needed.
        # Endpoints read the customer from the CustomerId claim, not from this value.
        api_key: nil,
        # Template category: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Complete definition of a message template including header, body, footer, and
        # buttons
        definition: nil,
        # Template language code (e.g., en_US)
        language: nil,
        # Template display name
        name: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        # Whether to submit the template for review after updating (default: false)
        submit_for_review: nil,
        idempotency_key: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            api_key: String,
            category: T.nilable(String),
            definition: T.nilable(Sentdm::TemplateDefinition),
            language: T.nilable(String),
            name: T.nilable(String),
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
