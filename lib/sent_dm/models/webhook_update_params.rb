# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#update
    class WebhookUpdateParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute display_name
      #
      #   @return [String, nil]
      optional :display_name, String

      # @!attribute endpoint_url
      #
      #   @return [String, nil]
      optional :endpoint_url, String

      # @!attribute event_types
      #
      #   @return [Array<String>, nil]
      optional :event_types, SentDm::Internal::Type::ArrayOf[String]

      # @!attribute retry_count
      #
      #   @return [Integer, nil]
      optional :retry_count, Integer

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!attribute timeout_seconds
      #
      #   @return [Integer, nil]
      optional :timeout_seconds, Integer

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(display_name: nil, endpoint_url: nil, event_types: nil, retry_count: nil, test_mode: nil, timeout_seconds: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::WebhookUpdateParams} for more details.
      #
      #   @param display_name [String]
      #
      #   @param endpoint_url [String]
      #
      #   @param event_types [Array<String>]
      #
      #   @param retry_count [Integer]
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param timeout_seconds [Integer]
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
