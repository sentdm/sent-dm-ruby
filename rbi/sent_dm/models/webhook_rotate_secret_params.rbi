# typed: strong

module SentDm
  module Models
    class WebhookRotateSecretParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(SentDm::WebhookRotateSecretParams, SentDm::Internal::AnyHash)
        end

      sig { returns(SentDm::WebhookRotateSecretParams::Body) }
      attr_reader :body

      sig { params(body: SentDm::WebhookRotateSecretParams::Body::OrHash).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          body: SentDm::WebhookRotateSecretParams::Body::OrHash,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body:, idempotency_key: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            body: SentDm::WebhookRotateSecretParams::Body,
            idempotency_key: String,
            request_options: SentDm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < SentDm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(
              SentDm::WebhookRotateSecretParams::Body,
              SentDm::Internal::AnyHash
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
