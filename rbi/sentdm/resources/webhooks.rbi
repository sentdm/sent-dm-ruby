# typed: strong

module Sentdm
  module Resources
    # Configure webhook endpoints for real-time event delivery
    class Webhooks
      # Creates a new webhook endpoint for the authenticated customer.
      sig do
        params(
          display_name: String,
          endpoint_url: String,
          event_types: T::Array[String],
          retry_count: Integer,
          sandbox: T::Boolean,
          timeout_seconds: Integer,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseWebhook)
      end
      def create(
        # Body param
        display_name: nil,
        # Body param
        endpoint_url: nil,
        # Body param
        event_types: nil,
        # Body param
        retry_count: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param
        timeout_seconds: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves a single webhook by ID for the authenticated customer.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseWebhook)
      end
      def retrieve(
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Updates an existing webhook for the authenticated customer.
      sig do
        params(
          id: String,
          display_name: String,
          endpoint_url: String,
          event_types: T::Array[String],
          retry_count: Integer,
          sandbox: T::Boolean,
          timeout_seconds: Integer,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseWebhook)
      end
      def update(
        # Path param
        id,
        # Body param
        display_name: nil,
        # Body param
        endpoint_url: nil,
        # Body param
        event_types: nil,
        # Body param
        retry_count: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param
        timeout_seconds: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves a paginated list of webhooks for the authenticated customer.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          is_active: T.nilable(T::Boolean),
          search: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::WebhookListResponse)
      end
      def list(
        # Query param
        page:,
        # Query param
        page_size:,
        # Query param
        is_active: nil,
        # Query param
        search: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Deletes a webhook for the authenticated customer.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def delete(
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves all available webhook event types that can be subscribed to.
      sig do
        params(
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::WebhookListEventTypesResponse)
      end
      def list_event_types(
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Retrieves a paginated list of delivery events for the specified webhook.
      sig do
        params(
          id: String,
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::WebhookListEventsResponse)
      end
      def list_events(
        # Path param
        id,
        # Query param
        page:,
        # Query param
        page_size:,
        # Query param
        search: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Generates a new signing secret for the specified webhook. The old secret is
      # immediately invalidated.
      sig do
        params(
          id: String,
          body: Sentdm::WebhookRotateSecretParams::Body::OrHash,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::WebhookRotateSecretResponse)
      end
      def rotate_secret(
        # Path param
        id,
        # Body param
        body:,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Sends a test event to the specified webhook endpoint to verify connectivity.
      sig do
        params(
          id: String,
          event_type: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::WebhookTestResponse)
      end
      def test_(
        # Path param
        id,
        # Body param
        event_type: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Activates or deactivates a webhook for the authenticated customer.
      sig do
        params(
          id: String,
          is_active: T::Boolean,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseWebhook)
      end
      def toggle_status(
        # Path param
        id,
        # Body param
        is_active: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Sentdm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
