# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#rotate_secret
    class WebhookRotateSecretParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Sentdm::Models::WebhookRotateSecretParams::Body]
      required :body, -> { Sentdm::WebhookRotateSecretParams::Body }

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(body:, idempotency_key: nil, request_options: {})
      #   @param body [Sentdm::Models::WebhookRotateSecretParams::Body]
      #   @param idempotency_key [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Body < Sentdm::Models::MutationRequest
        # @!method initialize
      end
    end
  end
end
