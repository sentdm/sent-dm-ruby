# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#create
    class WebhookCreateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

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

      # @!attribute is_inheritable
      #   Also delivers every sender profile's events to this webhook, at the same URL and
      #   with the same signing secret, and lets each profile see the webhook and read the
      #   events about itself. Off by default: the organization's own events only. Only an
      #   organization's version 2 webhook can set it.
      #
      #   @return [Boolean, nil]
      optional :is_inheritable, Sentdm::Internal::Type::Boolean

      # @!attribute retry_count
      #   Delivery retries. Applies to version 1 only: Svix retries a version 2 webhook on
      #   its own schedule.
      #
      #   @return [Integer, nil]
      optional :retry_count, Integer

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute sender_profile
      #   Request-only: the events an organization webhook's sender profile clones
      #   receive, one clone per existing and future profile. A version 1 webhook's
      #   responses report it as WebhookSenderProfileV3Response.
      #
      #   @return [Sentdm::Models::WebhookCreateParams::SenderProfile, nil]
      optional :sender_profile, -> { Sentdm::WebhookCreateParams::SenderProfile }, nil?: true

      # @!attribute timeout_seconds
      #   Delivery timeout. Applies to version 1 only.
      #
      #   @return [Integer, nil]
      optional :timeout_seconds, Integer

      # @!attribute webhook_version
      #   Who delivers the webhook: 2, the default, is delivered by Svix and signed with
      #   the webhook-id, webhook-timestamp and webhook-signature headers; 1 is the older
      #   delivery, signed with the X-Webhook-\* headers, which will be retired.
      #
      #   @return [Integer, nil]
      optional :webhook_version, Integer, nil?: true

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(display_name: nil, endpoint_url: nil, event_filters: nil, event_types: nil, is_inheritable: nil, retry_count: nil, sandbox: nil, sender_profile: nil, timeout_seconds: nil, webhook_version: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::WebhookCreateParams} for more details.
      #
      #   @param display_name [String]
      #
      #   @param endpoint_url [String]
      #
      #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
      #
      #   @param event_types [Array<String>]
      #
      #   @param is_inheritable [Boolean] Also delivers every sender profile's events to this webhook, at the same URL and
      #
      #   @param retry_count [Integer] Delivery retries. Applies to version 1 only: Svix retries a version 2 webhook on
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param sender_profile [Sentdm::Models::WebhookCreateParams::SenderProfile, nil] Request-only: the events an organization webhook's sender profile clones receive
      #
      #   @param timeout_seconds [Integer] Delivery timeout. Applies to version 1 only.
      #
      #   @param webhook_version [Integer, nil] Who delivers the webhook: 2, the default, is delivered by Svix and signed with t
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class SenderProfile < Sentdm::Internal::Type::BaseModel
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

        # @!method initialize(event_filters: nil, event_types: nil)
        #   Request-only: the events an organization webhook's sender profile clones
        #   receive, one clone per existing and future profile. A version 1 webhook's
        #   responses report it as WebhookSenderProfileV3Response.
        #
        #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
        #   @param event_types [Array<String>]
      end
    end
  end
end
