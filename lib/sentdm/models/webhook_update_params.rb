# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#update
    class WebhookUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute display_name
      #
      #   @return [String, nil]
      optional :display_name, String

      # @!attribute endpoint_url
      #
      #   @return [String, nil]
      optional :endpoint_url, String

      # @!attribute event_filters
      #
      #   @return [Hash{Symbol=>Array<String>}, nil]
      optional :event_filters,
               Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]],
               nil?: true

      # @!attribute event_types
      #
      #   @return [Array<String>, nil]
      optional :event_types, Sentdm::Internal::Type::ArrayOf[String]

      # @!attribute retry_count
      #
      #   @return [Integer, nil]
      optional :retry_count, Integer

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute timeout_seconds
      #
      #   @return [Integer, nil]
      optional :timeout_seconds, Integer

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(id:, display_name: nil, endpoint_url: nil, event_filters: nil, event_types: nil, retry_count: nil, sandbox: nil, timeout_seconds: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::WebhookUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param display_name [String]
      #
      #   @param endpoint_url [String]
      #
      #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
      #
      #   @param event_types [Array<String>]
      #
      #   @param retry_count [Integer]
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param timeout_seconds [Integer]
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
