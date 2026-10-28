# typed: strong

module Sentdm
  module Resources
    # Delivery reports and inbound messages, pushed to you.
    #
    # Subscribe an endpoint to the event types you care about —
    # `GET /v3/webhooks/event-types` lists them — and we POST each one as it happens,
    # retrying on failure. Polling `GET /v3/messages/{id}` works and does not scale.
    #
    # **Verify the signature.** Every delivery is signed with your endpoint's secret;
    # an unverified endpoint is one anybody can post to. `rotate-secret` replaces it,
    # `test` sends a specimen event, and `GET /v3/webhooks/{id}/events` shows what we
    # tried to deliver and what your endpoint answered — which is the first place to
    # look when something appears to be missing.
    class Webhooks
      # Creates a new webhook endpoint for the authenticated customer. A webhook is
      # version 2 unless the request sets webhook_version to 1: Svix delivers it, signed
      # with the webhook-id, webhook-timestamp and webhook-signature headers, and
      # retries it on its own schedule, so retry_count and timeout_seconds apply to
      # version 1 only. sender_profile applies to version 1 only and is ignored on
      # version 2; is_inheritable applies to version 2 only. A version 1 webhook's
      # response returns its sender_profile selection, with an empty event_types when it
      # is not cloned onto sender profiles; a version 2 webhook's response leaves
      # sender_profile out.
      sig do
        params(
          display_name: String,
          endpoint_url: String,
          event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
          event_types: T::Array[String],
          is_inheritable: T::Boolean,
          retry_count: Integer,
          sandbox: T::Boolean,
          sender_profile:
            T.nilable(Sentdm::WebhookCreateParams::SenderProfile::OrHash),
          timeout_seconds: Integer,
          webhook_version: T.nilable(Integer),
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
        event_filters: nil,
        # Body param
        event_types: nil,
        # Body param: Also delivers every sender profile's events to this webhook, at the
        # same URL and with the same signing secret, and lets each profile see the webhook
        # and read the events about itself. Off by default: the organization's own events
        # only. Only an organization's version 2 webhook can set it.
        is_inheritable: nil,
        # Body param: Delivery retries. Applies to version 1 only: Svix retries a version
        # 2 webhook on its own schedule.
        retry_count: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: Request-only: the events an organization webhook's sender profile
        # clones receive, one clone per existing and future profile. A version 1 webhook's
        # responses report it as WebhookSenderProfileV3Response.
        sender_profile: nil,
        # Body param: Delivery timeout. Applies to version 1 only.
        timeout_seconds: nil,
        # Body param: Who delivers the webhook: 2, the default, is delivered by Svix and
        # signed with the webhook-id, webhook-timestamp and webhook-signature headers; 1
        # is the older delivery, signed with the X-Webhook-\* headers, which will be
        # retired.
        webhook_version: nil,
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

      # Retrieves a single webhook by ID for the authenticated customer. A version 1
      # webhook includes its sender_profile selection.
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

      # Updates an existing webhook for the authenticated customer. Its version does not
      # change. sender_profile applies to a version 1 webhook and is_inheritable to a
      # version 2 one; retry_count and timeout_seconds apply to version 1 only. A
      # version 1 webhook's response returns its sender_profile selection as saved; a
      # version 2 webhook's response leaves sender_profile out.
      sig do
        params(
          id: String,
          display_name: String,
          endpoint_url: String,
          event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
          event_types: T::Array[String],
          is_inheritable: T.nilable(T::Boolean),
          retry_count: Integer,
          sandbox: T::Boolean,
          sender_profile:
            T.nilable(Sentdm::WebhookUpdateParams::SenderProfile::OrHash),
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
        event_filters: nil,
        # Body param
        event_types: nil,
        # Body param: Makes this webhook inheritable by the organization's sender profiles
        # (see create), or stops it being inheritable. Omit or pass null to keep it as it
        # is. Only a version 2 webhook can be inheritable.
        is_inheritable: nil,
        # Body param
        retry_count: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: Request-only: the events an organization webhook's sender profile
        # clones receive, one clone per existing and future profile. A version 1 webhook's
        # responses report it as WebhookSenderProfileV3Response.
        sender_profile: nil,
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

      # Retrieves a paginated list of webhooks for the authenticated customer. Each
      # version 1 webhook includes its sender_profile selection.
      sig do
        params(
          is_active: T.nilable(T::Boolean),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Internal::WebhooksPage[Sentdm::WebhookResponse])
      end
      def list(
        # Query param
        is_active: nil,
        # Query param
        page: nil,
        # Query param
        page_size: nil,
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

      # Retrieves a paginated list of delivery events for the specified webhook, newest
      # first. If the webhook is cloned onto your sender profiles (version 1) or
      # inheritable by them (version 2, is_inheritable), the list includes their events;
      # read payload.account_id to tell whose event it is. A sender profile may read its
      # organization's inheritable webhook too, and gets the events about itself.
      sig do
        params(
          id: String,
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(
          Sentdm::Internal::WebhookEventsPage[
            Sentdm::Models::WebhookListEventsResponse
          ]
        )
      end
      def list_events(
        # Path param
        id,
        # Query param
        page: nil,
        # Query param
        page_size: nil,
        # Query param
        search: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Generates a new signing secret for the specified webhook. A version 1 webhook's
      # old secret stops verifying at once. A version 2 webhook's deliveries are signed
      # with the new secret at once, and with the old one as well for the next 24 hours,
      # so a receiver can switch over without rejecting any; after that the old secret
      # no longer verifies.
      sig do
        params(
          id: String,
          sandbox: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Models::WebhookRotateSecretResponse)
      end
      def rotate_secret(
        # Path param
        id,
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

      # Sends a test event to the specified webhook endpoint to verify connectivity. A
      # version 1 webhook is tested at once and the answer says whether it was
      # delivered; a version 2 webhook's test is queued with Svix, which delivers it
      # right after, and the answer says it was queued.
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
