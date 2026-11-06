# frozen_string_literal: true

module Sentdm
  module Models
    class LinkEvent < Sentdm::Internal::Type::BaseModel
      # @!attribute event
      #   The specific event within the family, for example message.delivered,
      #   message.received or contact.opt_out. Absent on events that have no subtype, so
      #   treat it as optional.
      #
      #   @return [String, nil]
      optional :event, String, nil?: true

      # @!attribute field
      #   The event family, for example message, templates or contact. Route on this
      #   first, then on event for the specific change.
      #
      #   @return [String, nil]
      optional :field, String

      # @!attribute payload
      #   Body of a link event: something happened to a tracked link Sent published on the
      #   customer's behalf. A link points either at a URL the customer supplied or at a
      #   file Sent hosts for them; LinkKind says which. Delivered when an eligible
      #   request is served, or when a published link reaches the end of its life.
      #
      #   A click is a request, not a read receipt. link.clicked means the redirect was
      #   served; link.downloaded means bytes went out. Neither proves a person saw
      #   anything — messaging providers and link scanners fetch URLs on their own, which
      #   is what TrafficClass exists to tell apart. Filter on it before reporting a
      #   click-through rate; treat likely_human as a hint, never as delivery
      #   confirmation.
      #
      #   RecordId identifies the link; the X-Webhook-Event-ID header identifies the
      #   delivery. One link is hit many times, so those are the two keys a subscriber
      #   needs: group by the first, deduplicate on the second — exactly as on every other
      #   family. The payload carries no event identifier of its own, for the same reason
      #   none of the others do.
      #
      #   Nothing here identifies the visitor. No IP address and no visitor token crosses
      #   this boundary. Country, Device and Browser are coarse buckets derived at the
      #   edge and are absent whenever the request did not supply enough to derive them.
      #
      #   @return [Sentdm::Models::LinkEventPayload, nil]
      optional :payload, -> { Sentdm::LinkEventPayload }, nil?: true

      # @!attribute request_id
      #   The event-specific body.
      #
      #   @return [String, nil]
      optional :request_id, String, nil?: true

      # @!attribute timestamp
      #   When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
      #   time, not the time the underlying change happened. Use the timestamp inside the
      #   payload for the latter.
      #
      #   @return [String, nil]
      optional :timestamp, String

      # @!method initialize(event: nil, field: nil, payload: nil, request_id: nil, timestamp: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::LinkEvent} for more details.
      #
      #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
      #   this shape and varies only in Payload.
      #
      #   @param event [String, nil] The specific event within the family, for example message.delivered,
      #
      #   @param field [String] The event family, for example message, templates or contact. Route on
      #
      #   @param payload [Sentdm::Models::LinkEventPayload, nil] Body of a link event: something happened to a tracked link Sent published on the
      #
      #   @param request_id [String, nil] The event-specific body.
      #
      #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
    end
  end
end
