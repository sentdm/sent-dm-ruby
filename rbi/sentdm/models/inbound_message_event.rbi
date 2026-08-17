# typed: strong

module Sentdm
  module Models
    class InboundMessageEvent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::InboundMessageEvent, Sentdm::Internal::AnyHash)
        end

      # The specific event within the family, for example message.delivered or
      # message.received. Absent on events that have no subtype, so treat it as
      # optional.
      sig { returns(T.nilable(String)) }
      attr_accessor :event

      # The event family, for example message or templates. Route on this first, then on
      # event for the specific change.
      sig { returns(T.nilable(String)) }
      attr_reader :field

      sig { params(field: String).void }
      attr_writer :field

      # Body of a message.received event. Delivered when a contact messages one of your
      # numbers.
      sig { returns(T.nilable(Sentdm::InboundMessageEventPayload)) }
      attr_reader :payload

      sig do
        params(
          payload: T.nilable(Sentdm::InboundMessageEventPayload::OrHash)
        ).void
      end
      attr_writer :payload

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
          payload: T.nilable(Sentdm::InboundMessageEventPayload::OrHash),
          timestamp: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The specific event within the family, for example message.delivered or
        # message.received. Absent on events that have no subtype, so treat it as
        # optional.
        event: nil,
        # The event family, for example message or templates. Route on this first, then on
        # event for the specific change.
        field: nil,
        # Body of a message.received event. Delivered when a contact messages one of your
        # numbers.
        payload: nil,
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
            payload: T.nilable(Sentdm::InboundMessageEventPayload),
            timestamp: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
