# typed: strong

module Sentdm
  module Models
    class ContactEvent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ContactEvent, Sentdm::Internal::AnyHash) }

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

      # Body of a contact.opt_in, contact.opt_out, contact.help or
      # contact.custom_keyword event. Delivered when a contact signals a consent change,
      # asks for help, or sends one of your own auto-reply keywords.
      #
      # These events state the signal outright, so you do not have to recognise keywords
      # in the text of a message.received event. They also cover cases that produce no
      # inbound message at all, such as a network handling an opt-out on your behalf.
      #
      # Two of the four change consent and two do not: contact.help and
      # contact.custom_keyword report the state the contact already had. Read opt_out
      # for the state and the envelope's event for what happened, rather than inferring
      # one from the other.
      #
      # Fields are ordered identity → resulting state → provenance → join keys. The two
      # parties are from and to. Note that the message family has not moved to those
      # names yet — message.received still calls the same two parties inbound_number and
      # outbound_number. Nothing here restates the envelope: which signal occurred is
      # the envelope's event, and when it was emitted is its timestamp. Retries carry
      # the same X-Webhook-Event-ID header, which is what to deduplicate on.
      sig { returns(T.nilable(Sentdm::ContactEventPayload)) }
      attr_reader :payload

      sig do
        params(payload: T.nilable(Sentdm::ContactEventPayload::OrHash)).void
      end
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
          payload: T.nilable(Sentdm::ContactEventPayload::OrHash),
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
        # Body of a contact.opt_in, contact.opt_out, contact.help or
        # contact.custom_keyword event. Delivered when a contact signals a consent change,
        # asks for help, or sends one of your own auto-reply keywords.
        #
        # These events state the signal outright, so you do not have to recognise keywords
        # in the text of a message.received event. They also cover cases that produce no
        # inbound message at all, such as a network handling an opt-out on your behalf.
        #
        # Two of the four change consent and two do not: contact.help and
        # contact.custom_keyword report the state the contact already had. Read opt_out
        # for the state and the envelope's event for what happened, rather than inferring
        # one from the other.
        #
        # Fields are ordered identity → resulting state → provenance → join keys. The two
        # parties are from and to. Note that the message family has not moved to those
        # names yet — message.received still calls the same two parties inbound_number and
        # outbound_number. Nothing here restates the envelope: which signal occurred is
        # the envelope's event, and when it was emitted is its timestamp. Retries carry
        # the same X-Webhook-Event-ID header, which is what to deduplicate on.
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
            payload: T.nilable(Sentdm::ContactEventPayload),
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
