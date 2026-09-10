# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_events
    class WebhookListEventsResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute delivery_attempts
      #
      #   @return [Integer, nil]
      optional :delivery_attempts, Integer

      # @!attribute delivery_status
      #
      #   @return [String, nil]
      optional :delivery_status, String

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, nil?: true

      # @!attribute event_data
      #   The exact event body that was delivered, or attempted, for this record. One of
      #   the three webhook envelopes: a message status change, an inbound message, or a
      #   template status change. Read field and event to tell which, the same way your
      #   endpoint does.
      #
      #   @return [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent, nil]
      optional :event_data, union: -> { Sentdm::Models::WebhookListEventsResponse::EventData }

      # @!attribute event_type
      #
      #   @return [String, nil]
      optional :event_type, String

      # @!attribute http_status_code
      #
      #   @return [Integer, nil]
      optional :http_status_code, Integer, nil?: true

      # @!attribute processing_completed_at
      #
      #   @return [Time, nil]
      optional :processing_completed_at, Time, nil?: true

      # @!attribute processing_started_at
      #
      #   @return [Time, nil]
      optional :processing_started_at, Time, nil?: true

      # @!attribute response_body
      #
      #   @return [String, nil]
      optional :response_body, String, nil?: true

      # @!method initialize(id: nil, created_at: nil, delivery_attempts: nil, delivery_status: nil, error_message: nil, event_data: nil, event_type: nil, http_status_code: nil, processing_completed_at: nil, processing_started_at: nil, response_body: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::WebhookListEventsResponse} for more details.
      #
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param delivery_attempts [Integer]
      #
      #   @param delivery_status [String]
      #
      #   @param error_message [String, nil]
      #
      #   @param event_data [Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent] The exact event body that was delivered, or attempted, for this record. One of t
      #
      #   @param event_type [String]
      #
      #   @param http_status_code [Integer, nil]
      #
      #   @param processing_completed_at [Time, nil]
      #
      #   @param processing_started_at [Time, nil]
      #
      #   @param response_body [String, nil]

      # The exact event body that was delivered, or attempted, for this record. One of
      # the three webhook envelopes: a message status change, an inbound message, or a
      # template status change. Read field and event to tell which, the same way your
      # endpoint does.
      #
      # @see Sentdm::Models::WebhookListEventsResponse#event_data
      module EventData
        extend Sentdm::Internal::Type::Union

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::MessageEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::InboundMessageEvent }

        # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares this shape and
        # varies only in Payload.
        variant -> { Sentdm::TemplateEvent }

        # @!method self.variants
        #   @return [Array(Sentdm::Models::MessageEvent, Sentdm::Models::InboundMessageEvent, Sentdm::Models::TemplateEvent)]
      end
    end
  end
end
