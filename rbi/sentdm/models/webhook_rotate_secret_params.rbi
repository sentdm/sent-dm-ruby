# typed: strong

module Sentdm
  module Models
    class WebhookRotateSecretParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookRotateSecretParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(Sentdm::WebhookRotateSecretParams::Body) }
      attr_reader :body

      sig { params(body: Sentdm::WebhookRotateSecretParams::Body::OrHash).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          body: Sentdm::WebhookRotateSecretParams::Body::OrHash,
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body:, idempotency_key: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            body: Sentdm::WebhookRotateSecretParams::Body,
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < Sentdm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::WebhookRotateSecretParams::Body,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
