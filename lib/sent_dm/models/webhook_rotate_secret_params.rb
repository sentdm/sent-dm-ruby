# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#rotate_secret
    class WebhookRotateSecretParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [SentDm::Models::WebhookRotateSecretParams::Body]
      required :body, -> { SentDm::WebhookRotateSecretParams::Body }

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(body:, idempotency_key: nil, request_options: {})
      #   @param body [SentDm::Models::WebhookRotateSecretParams::Body]
      #   @param idempotency_key [String]
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]

      class Body < SentDm::Models::MutationRequest
        # @!method initialize
      end
    end
  end
end
