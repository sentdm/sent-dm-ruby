# typed: strong

module Sentdm
  module Models
    class ChannelEvent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ChannelEvent, Sentdm::Internal::AnyHash) }

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

      # Body of a channel event: where one of the customer's channels stands in
      # provisioning and compliance. Delivered when a milestone moves — a registration
      # filed, a verdict returned, a resubmission asked for, a sender gone live — so a
      # customer's own onboarding UI does not have to poll GET /v3/channels.
      #
      # The subject is one item, never the account. A customer's "SMS channel" has no
      # status; a market does. Country, NumberType and SenderValue name which one, so a
      # customer terminating only to Kosovo never receives an event about US 10DLC.
      #
      # Status is the stable half of the contract. It is the same four-value set GET
      # /v3/channels publishes, computed through the same code, so an event and a read
      # of the same market cannot disagree. A subscriber that reads nothing but the
      # status and the subject fields is a correct subscriber. The sub-type on the
      # envelope names the specific milestone and is additive — that vocabulary comes
      # from registries and carriers, which are parties Sent does not control.
      #
      # Status means provisioning and compliance are complete, not that a send will
      # succeed right now. An account can be suspended, or a destination blocked by a
      # routing rule, without either showing up here. Those are separate surfaces and
      # deliberately not modelled on this payload.
      sig { returns(T.nilable(Sentdm::ChannelEventPayload)) }
      attr_reader :payload

      sig do
        params(payload: T.nilable(Sentdm::ChannelEventPayload::OrHash)).void
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
          payload: T.nilable(Sentdm::ChannelEventPayload::OrHash),
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
        # Body of a channel event: where one of the customer's channels stands in
        # provisioning and compliance. Delivered when a milestone moves — a registration
        # filed, a verdict returned, a resubmission asked for, a sender gone live — so a
        # customer's own onboarding UI does not have to poll GET /v3/channels.
        #
        # The subject is one item, never the account. A customer's "SMS channel" has no
        # status; a market does. Country, NumberType and SenderValue name which one, so a
        # customer terminating only to Kosovo never receives an event about US 10DLC.
        #
        # Status is the stable half of the contract. It is the same four-value set GET
        # /v3/channels publishes, computed through the same code, so an event and a read
        # of the same market cannot disagree. A subscriber that reads nothing but the
        # status and the subject fields is a correct subscriber. The sub-type on the
        # envelope names the specific milestone and is additive — that vocabulary comes
        # from registries and carriers, which are parties Sent does not control.
        #
        # Status means provisioning and compliance are complete, not that a send will
        # succeed right now. An account can be suspended, or a destination blocked by a
        # routing rule, without either showing up here. Those are separate surfaces and
        # deliberately not modelled on this payload.
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
            payload: T.nilable(Sentdm::ChannelEventPayload),
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
