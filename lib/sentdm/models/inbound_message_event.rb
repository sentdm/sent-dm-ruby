# frozen_string_literal: true

module Sentdm
  module Models
    class InboundMessageEvent < Sentdm::Internal::Type::BaseModel
      # @!attribute event
      #   The specific event within the family, for example message.delivered or
      #   message.received. Absent on events that have no subtype, so treat it as
      #   optional.
      #
      #   @return [String, nil]
      optional :event, String, nil?: true

      # @!attribute field
      #   The event family, for example message or templates. Route on this first, then on
      #   event for the specific change.
      #
      #   @return [String, nil]
      optional :field, String

      # @!attribute payload
      #   Body of a message.received event. Delivered when a contact messages one of your
      #   numbers.
      #
      #   @return [Sentdm::Models::InboundMessageEventPayload, nil]
      optional :payload, -> { Sentdm::InboundMessageEventPayload }, nil?: true

      # @!attribute timestamp
      #   When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
      #   time, not the time the underlying change happened. Use the timestamp inside the
      #   payload for the latter.
      #
      #   @return [String, nil]
      optional :timestamp, String

      # @!method initialize(event: nil, field: nil, payload: nil, timestamp: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::InboundMessageEvent} for more details.
      #
      #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
      #   this shape and varies only in Payload.
      #
      #   @param event [String, nil] The specific event within the family, for example message.delivered or
      #
      #   @param field [String] The event family, for example message or templates. Route on this first, then
      #
      #   @param payload [Sentdm::Models::InboundMessageEventPayload, nil] Body of a message.received event. Delivered when a contact messages one of your
      #
      #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
    end
  end
end
