# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list
    class WebhookResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute consecutive_failures
      #   Failed attempts since the last success. Version 1 only: always 0 on a version 2
      #   webhook, whose deliveries are in its events (GET /v3/webhooks/{id}/events).
      #
      #   @return [Integer, nil]
      optional :consecutive_failures, Integer

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute customer_id
      #   Which customer owns this — the key's own, or the profile named in x-profile-id.
      #   Says whose resource this is, which the resource's own id does not.
      #
      #   @return [String, nil]
      optional :customer_id, String

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

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, Sentdm::Internal::Type::Boolean

      # @!attribute is_inheritable
      #   Whether the webhook also receives its organization's sender profiles' events,
      #   and each profile sees it and reads the events about itself. Always false on a
      #   version 1 webhook.
      #
      #   @return [Boolean, nil]
      optional :is_inheritable, Sentdm::Internal::Type::Boolean

      # @!attribute last_delivery_attempt_at
      #   When the webhook was last attempted. Version 1 only: always null on a version 2
      #   webhook.
      #
      #   @return [Time, nil]
      optional :last_delivery_attempt_at, Time, nil?: true

      # @!attribute last_successful_delivery_at
      #   When the webhook last received an event. Version 1 only: always null on a
      #   version 2 webhook.
      #
      #   @return [Time, nil]
      optional :last_successful_delivery_at, Time, nil?: true

      # @!attribute retry_count
      #
      #   @return [Integer, nil]
      optional :retry_count, Integer

      # @!attribute sender_profile
      #   The events a version 1 webhook's sender profile clones receive, as a response
      #   reports them.
      #
      #   Its own type, field for field the same as the request's sender_profile. A
      #   response is not a request, whatever it carries.
      #
      #   @return [Sentdm::Models::WebhookResponse::SenderProfile, nil]
      optional :sender_profile, -> { Sentdm::WebhookResponse::SenderProfile }, nil?: true

      # @!attribute signing_secret
      #
      #   @return [String, nil]
      optional :signing_secret, String, nil?: true

      # @!attribute timeout_seconds
      #
      #   @return [Integer, nil]
      optional :timeout_seconds, Integer

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!attribute webhook_version
      #   Who delivers the webhook: 1 the older delivery, which will be retired, or 2
      #   Svix. A webhook is created as version 2 unless the request asks for 1.
      #
      #   @return [Integer, nil]
      optional :webhook_version, Integer

      # @!method initialize(id: nil, consecutive_failures: nil, created_at: nil, customer_id: nil, display_name: nil, endpoint_url: nil, event_filters: nil, event_types: nil, is_active: nil, is_inheritable: nil, last_delivery_attempt_at: nil, last_successful_delivery_at: nil, retry_count: nil, sender_profile: nil, signing_secret: nil, timeout_seconds: nil, updated_at: nil, webhook_version: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::WebhookResponse} for more details.
      #
      #   @param id [String]
      #
      #   @param consecutive_failures [Integer] Failed attempts since the last success. Version 1 only: always 0 on a version 2
      #
      #   @param created_at [Time]
      #
      #   @param customer_id [String] Which customer owns this — the key's own, or the profile named in x-profile-id.
      #
      #   @param display_name [String]
      #
      #   @param endpoint_url [String]
      #
      #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
      #
      #   @param event_types [Array<String>]
      #
      #   @param is_active [Boolean]
      #
      #   @param is_inheritable [Boolean] Whether the webhook also receives its organization's sender profiles' events, an
      #
      #   @param last_delivery_attempt_at [Time, nil] When the webhook was last attempted. Version 1 only: always null on a version 2
      #
      #   @param last_successful_delivery_at [Time, nil] When the webhook last received an event. Version 1 only: always null on a versio
      #
      #   @param retry_count [Integer]
      #
      #   @param sender_profile [Sentdm::Models::WebhookResponse::SenderProfile, nil] The events a version 1 webhook's sender profile clones receive, as a response re
      #
      #   @param signing_secret [String, nil]
      #
      #   @param timeout_seconds [Integer]
      #
      #   @param updated_at [Time, nil]
      #
      #   @param webhook_version [Integer] Who delivers the webhook: 1 the older delivery, which will be retired, or 2 Svix

      # @see Sentdm::Models::WebhookResponse#sender_profile
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
        #   The events a version 1 webhook's sender profile clones receive, as a response
        #   reports them.
        #
        #   Its own type, field for field the same as the request's sender_profile. A
        #   response is not a request, whatever it carries.
        #
        #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
        #   @param event_types [Array<String>]
      end
    end
  end
end
