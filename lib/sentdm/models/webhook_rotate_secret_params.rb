# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#rotate_secret
    class WebhookRotateSecretParams < Sentdm::Models::MutationRequest
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(id:, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   @param id [String]
      #   @param idempotency_key [String]
      #   @param x_profile_id [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
