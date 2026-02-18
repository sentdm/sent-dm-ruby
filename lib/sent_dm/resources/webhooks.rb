# frozen_string_literal: true

module SentDm
  module Resources
    class Webhooks
      # Some parameter documentations has been truncated, see
      # {SentDm::Models::WebhookCreateParams} for more details.
      #
      # Creates a new webhook endpoint for the authenticated customer.
      #
      # @overload create(display_name: nil, endpoint_url: nil, event_types: nil, retry_count: nil, test_mode: nil, timeout_seconds: nil, idempotency_key: nil, request_options: {})
      #
      # @param display_name [String] Body param
      #
      # @param endpoint_url [String] Body param
      #
      # @param event_types [Array<String>] Body param
      #
      # @param retry_count [Integer] Body param
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param timeout_seconds [Integer] Body param
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseWebhook]
      #
      # @see SentDm::Models::WebhookCreateParams
      def create(params = {})
        parsed, options = SentDm::WebhookCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "v3/webhooks",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseWebhook,
          options: options
        )
      end

      # Retrieves a single webhook by ID for the authenticated customer.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseWebhook]
      #
      # @see SentDm::Models::WebhookRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v3/webhooks/%1$s", id],
          model: SentDm::APIResponseWebhook,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::WebhookUpdateParams} for more details.
      #
      # Updates an existing webhook for the authenticated customer.
      #
      # @overload update(id, display_name: nil, endpoint_url: nil, event_types: nil, retry_count: nil, test_mode: nil, timeout_seconds: nil, idempotency_key: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param display_name [String] Body param
      #
      # @param endpoint_url [String] Body param
      #
      # @param event_types [Array<String>] Body param
      #
      # @param retry_count [Integer] Body param
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param timeout_seconds [Integer] Body param
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseWebhook]
      #
      # @see SentDm::Models::WebhookUpdateParams
      def update(id, params = {})
        parsed, options = SentDm::WebhookUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :put,
          path: ["v3/webhooks/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseWebhook,
          options: options
        )
      end

      # Retrieves a paginated list of webhooks for the authenticated customer.
      #
      # @overload list(page:, page_size:, is_active: nil, search: nil, request_options: {})
      #
      # @param page [Integer]
      # @param page_size [Integer]
      # @param is_active [Boolean, nil]
      # @param search [String, nil]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::WebhookListResponse]
      #
      # @see SentDm::Models::WebhookListParams
      def list(params)
        parsed, options = SentDm::WebhookListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/webhooks",
          query: parsed.transform_keys(page_size: "pageSize", is_active: "isActive"),
          model: SentDm::Models::WebhookListResponse,
          options: options
        )
      end

      # Deletes a webhook for the authenticated customer.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see SentDm::Models::WebhookDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v3/webhooks/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Retrieves all available webhook event types that can be subscribed to.
      #
      # @overload list_event_types(request_options: {})
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::WebhookListEventTypesResponse]
      #
      # @see SentDm::Models::WebhookListEventTypesParams
      def list_event_types(params = {})
        @client.request(
          method: :get,
          path: "v3/webhooks/event-types",
          model: SentDm::Models::WebhookListEventTypesResponse,
          options: params[:request_options]
        )
      end

      # Retrieves a paginated list of delivery events for the specified webhook.
      #
      # @overload list_events(id, page:, page_size:, search: nil, request_options: {})
      #
      # @param id [String]
      # @param page [Integer]
      # @param page_size [Integer]
      # @param search [String, nil]
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::WebhookListEventsResponse]
      #
      # @see SentDm::Models::WebhookListEventsParams
      def list_events(id, params)
        parsed, options = SentDm::WebhookListEventsParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/webhooks/%1$s/events", id],
          query: parsed.transform_keys(page_size: "pageSize"),
          model: SentDm::Models::WebhookListEventsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::WebhookRotateSecretParams} for more details.
      #
      # Generates a new signing secret for the specified webhook. The old secret is
      # immediately invalidated.
      #
      # @overload rotate_secret(id, body:, idempotency_key: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param body [SentDm::Models::WebhookRotateSecretParams::Body] Body param
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::WebhookRotateSecretResponse]
      #
      # @see SentDm::Models::WebhookRotateSecretParams
      def rotate_secret(id, params)
        parsed, options = SentDm::WebhookRotateSecretParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v3/webhooks/%1$s/rotate-secret", id],
          headers: parsed.except(:body).transform_keys(idempotency_key: "idempotency-key"),
          body: parsed[:body],
          model: SentDm::Models::WebhookRotateSecretResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::WebhookTestParams} for more details.
      #
      # Sends a test event to the specified webhook endpoint to verify connectivity.
      #
      # @overload test_(id, event_type: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param event_type [String] Body param
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::WebhookTestResponse]
      #
      # @see SentDm::Models::WebhookTestParams
      def test_(id, params = {})
        parsed, options = SentDm::WebhookTestParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: ["v3/webhooks/%1$s/test", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::Models::WebhookTestResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {SentDm::Models::WebhookToggleStatusParams} for more details.
      #
      # Activates or deactivates a webhook for the authenticated customer.
      #
      # @overload toggle_status(id, is_active: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param is_active [Boolean] Body param
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [SentDm::Models::APIResponseWebhook]
      #
      # @see SentDm::Models::WebhookToggleStatusParams
      def toggle_status(id, params = {})
        parsed, options = SentDm::WebhookToggleStatusParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :patch,
          path: ["v3/webhooks/%1$s/toggle-status", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: SentDm::APIResponseWebhook,
          options: options
        )
      end

      # @api private
      #
      # @param client [SentDm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
