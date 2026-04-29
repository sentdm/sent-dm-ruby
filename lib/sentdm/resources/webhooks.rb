# frozen_string_literal: true

module Sentdm
  module Resources
    # Configure webhook endpoints for real-time event delivery
    class Webhooks
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookCreateParams} for more details.
      #
      # Creates a new webhook endpoint for the authenticated customer.
      #
      # @overload create(display_name: nil, endpoint_url: nil, event_filters: nil, event_types: nil, retry_count: nil, sandbox: nil, timeout_seconds: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param display_name [String] Body param
      #
      # @param endpoint_url [String] Body param
      #
      # @param event_filters [Hash{Symbol=>Array<String>}, nil] Body param
      #
      # @param event_types [Array<String>] Body param
      #
      # @param retry_count [Integer] Body param
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param timeout_seconds [Integer] Body param
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseWebhook]
      #
      # @see Sentdm::Models::WebhookCreateParams
      def create(params = {})
        parsed, options = Sentdm::WebhookCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: "v3/webhooks",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseWebhook,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookRetrieveParams} for more details.
      #
      # Retrieves a single webhook by ID for the authenticated customer.
      #
      # @overload retrieve(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String]
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseWebhook]
      #
      # @see Sentdm::Models::WebhookRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Sentdm::WebhookRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/webhooks/%1$s", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseWebhook,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookUpdateParams} for more details.
      #
      # Updates an existing webhook for the authenticated customer.
      #
      # @overload update(id, display_name: nil, endpoint_url: nil, event_filters: nil, event_types: nil, retry_count: nil, sandbox: nil, timeout_seconds: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param display_name [String] Body param
      #
      # @param endpoint_url [String] Body param
      #
      # @param event_filters [Hash{Symbol=>Array<String>}, nil] Body param
      #
      # @param event_types [Array<String>] Body param
      #
      # @param retry_count [Integer] Body param
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param timeout_seconds [Integer] Body param
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseWebhook]
      #
      # @see Sentdm::Models::WebhookUpdateParams
      def update(id, params = {})
        parsed, options = Sentdm::WebhookUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :put,
          path: ["v3/webhooks/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseWebhook,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookListParams} for more details.
      #
      # Retrieves a paginated list of webhooks for the authenticated customer.
      #
      # @overload list(page:, page_size:, is_active: nil, search: nil, x_profile_id: nil, request_options: {})
      #
      # @param page [Integer] Query param
      #
      # @param page_size [Integer] Query param
      #
      # @param is_active [Boolean, nil] Query param
      #
      # @param search [String, nil] Query param
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::WebhookListResponse]
      #
      # @see Sentdm::Models::WebhookListParams
      def list(params)
        query_params = [:page, :page_size, :is_active, :search]
        parsed, options = Sentdm::WebhookListParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v3/webhooks",
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::WebhookListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookDeleteParams} for more details.
      #
      # Deletes a webhook for the authenticated customer.
      #
      # @overload delete(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String]
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::WebhookDeleteParams
      def delete(id, params = {})
        parsed, options = Sentdm::WebhookDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/webhooks/%1$s", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookListEventTypesParams} for more details.
      #
      # Retrieves all available webhook event types that can be subscribed to.
      #
      # @overload list_event_types(x_profile_id: nil, request_options: {})
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::WebhookListEventTypesResponse]
      #
      # @see Sentdm::Models::WebhookListEventTypesParams
      def list_event_types(params = {})
        parsed, options = Sentdm::WebhookListEventTypesParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/webhooks/event-types",
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::WebhookListEventTypesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookListEventsParams} for more details.
      #
      # Retrieves a paginated list of delivery events for the specified webhook.
      #
      # @overload list_events(id, page:, page_size:, search: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param page [Integer] Query param
      #
      # @param page_size [Integer] Query param
      #
      # @param search [String, nil] Query param
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::WebhookListEventsResponse]
      #
      # @see Sentdm::Models::WebhookListEventsParams
      def list_events(id, params)
        query_params = [:page, :page_size, :search]
        parsed, options = Sentdm::WebhookListEventsParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: ["v3/webhooks/%1$s/events", id],
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::WebhookListEventsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookRotateSecretParams} for more details.
      #
      # Generates a new signing secret for the specified webhook. The old secret is
      # immediately invalidated.
      #
      # @overload rotate_secret(id, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::WebhookRotateSecretResponse]
      #
      # @see Sentdm::Models::WebhookRotateSecretParams
      def rotate_secret(id, params = {})
        parsed, options = Sentdm::WebhookRotateSecretParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: ["v3/webhooks/%1$s/rotate-secret", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::Models::WebhookRotateSecretResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookTestParams} for more details.
      #
      # Sends a test event to the specified webhook endpoint to verify connectivity.
      #
      # @overload test_(id, event_type: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param event_type [String] Body param
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::WebhookTestResponse]
      #
      # @see Sentdm::Models::WebhookTestParams
      def test_(id, params = {})
        parsed, options = Sentdm::WebhookTestParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: ["v3/webhooks/%1$s/test", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::Models::WebhookTestResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::WebhookToggleStatusParams} for more details.
      #
      # Activates or deactivates a webhook for the authenticated customer.
      #
      # @overload toggle_status(id, is_active: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param
      #
      # @param is_active [Boolean] Body param
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseWebhook]
      #
      # @see Sentdm::Models::WebhookToggleStatusParams
      def toggle_status(id, params = {})
        parsed, options = Sentdm::WebhookToggleStatusParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :patch,
          path: ["v3/webhooks/%1$s/toggle-status", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseWebhook,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
