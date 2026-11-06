# typed: strong

module Sentdm
  module Models
    class LinkEvent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::LinkEvent, Sentdm::Internal::AnyHash) }

      # The specific event within the family, for example message.delivered,
      # message.received or contact.opt_out. Absent on events that have no subtype, so
      # treat it as optional.
      sig { returns(T.nilable(String)) }
      attr_accessor :event

      # The event family, for example message, templates or contact. Route on this
      # first, then on event for the specific change.
      sig { returns(T.nilable(String)) }
      attr_reader :field

      sig { params(field: String).void }
      attr_writer :field

      # Body of a link event: something happened to a tracked link Sent published on the
      # customer's behalf. A link points either at a URL the customer supplied or at a
      # file Sent hosts for them; LinkKind says which. Delivered when an eligible
      # request is served, or when a published link reaches the end of its life.
      #
      # A click is a request, not a read receipt. link.clicked means the redirect was
      # served; link.downloaded means bytes went out. Neither proves a person saw
      # anything — messaging providers and link scanners fetch URLs on their own, which
      # is what TrafficClass exists to tell apart. Filter on it before reporting a
      # click-through rate; treat likely_human as a hint, never as delivery
      # confirmation.
      #
      # RecordId identifies the link; the X-Webhook-Event-ID header identifies the
      # delivery. One link is hit many times, so those are the two keys a subscriber
      # needs: group by the first, deduplicate on the second — exactly as on every other
      # family. The payload carries no event identifier of its own, for the same reason
      # none of the others do.
      #
      # Nothing here identifies the visitor. No IP address and no visitor token crosses
      # this boundary. Country, Device and Browser are coarse buckets derived at the
      # edge and are absent whenever the request did not supply enough to derive them.
      sig { returns(T.nilable(Sentdm::LinkEventPayload)) }
      attr_reader :payload

      sig { params(payload: T.nilable(Sentdm::LinkEventPayload::OrHash)).void }
      attr_writer :payload

      # The event-specific body.
      sig { returns(T.nilable(String)) }
      attr_accessor :request_id

      # When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
      # time, not the time the underlying change happened. Use the timestamp inside the
      # payload for the latter.
      sig { returns(T.nilable(String)) }
      attr_reader :timestamp

      sig { params(timestamp: String).void }
      attr_writer :timestamp

      # The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
      # this shape and varies only in Payload.
      sig do
        params(
          event: T.nilable(String),
          field: String,
          payload: T.nilable(Sentdm::LinkEventPayload::OrHash),
          request_id: T.nilable(String),
          timestamp: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The specific event within the family, for example message.delivered,
        # message.received or contact.opt_out. Absent on events that have no subtype, so
        # treat it as optional.
        event: nil,
        # The event family, for example message, templates or contact. Route on this
        # first, then on event for the specific change.
        field: nil,
        # Body of a link event: something happened to a tracked link Sent published on the
        # customer's behalf. A link points either at a URL the customer supplied or at a
        # file Sent hosts for them; LinkKind says which. Delivered when an eligible
        # request is served, or when a published link reaches the end of its life.
        #
        # A click is a request, not a read receipt. link.clicked means the redirect was
        # served; link.downloaded means bytes went out. Neither proves a person saw
        # anything — messaging providers and link scanners fetch URLs on their own, which
        # is what TrafficClass exists to tell apart. Filter on it before reporting a
        # click-through rate; treat likely_human as a hint, never as delivery
        # confirmation.
        #
        # RecordId identifies the link; the X-Webhook-Event-ID header identifies the
        # delivery. One link is hit many times, so those are the two keys a subscriber
        # needs: group by the first, deduplicate on the second — exactly as on every other
        # family. The payload carries no event identifier of its own, for the same reason
        # none of the others do.
        #
        # Nothing here identifies the visitor. No IP address and no visitor token crosses
        # this boundary. Country, Device and Browser are coarse buckets derived at the
        # edge and are absent whenever the request did not supply enough to derive them.
        payload: nil,
        # The event-specific body.
        request_id: nil,
        # When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
        # time, not the time the underlying change happened. Use the timestamp inside the
        # payload for the latter.
        timestamp: nil
      )
      end

      sig do
        override.returns(
          {
            event: T.nilable(String),
            field: String,
            payload: T.nilable(Sentdm::LinkEventPayload),
            request_id: T.nilable(String),
            timestamp: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
