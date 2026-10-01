# typed: strong

module Sentdm
  module Models
    class CallEvent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::CallEvent, Sentdm::Internal::AnyHash) }

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

      # Body of a call.initiated, call.answered, call.completed, call.failed or
      # call.recording_ready event. Which of them occurred is the envelope's event.
      #
      # Shaped like the message, inbound, template and channel payloads: account_id
      # names the account the event is about, channel names the channel, and updated_at
      # is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
      # duration_seconds and price are added on call.completed, reason on call.failed
      # and recording_id on call.recording_ready; each is omitted rather than sent as
      # null when it does not apply.
      #
      # Casing is snake_case because these ride the same webhook stream customers
      # already parse message_id from; the question/answer contract is a separate
      # surface and stays camelCase. Nothing here is provider-shaped: no provider call
      # id, no namespaced identity.
      sig { returns(T.nilable(Sentdm::CallEventPayload)) }
      attr_reader :payload

      sig { params(payload: T.nilable(Sentdm::CallEventPayload::OrHash)).void }
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
          payload: T.nilable(Sentdm::CallEventPayload::OrHash),
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
        # Body of a call.initiated, call.answered, call.completed, call.failed or
        # call.recording_ready event. Which of them occurred is the envelope's event.
        #
        # Shaped like the message, inbound, template and channel payloads: account_id
        # names the account the event is about, channel names the channel, and updated_at
        # is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
        # duration_seconds and price are added on call.completed, reason on call.failed
        # and recording_id on call.recording_ready; each is omitted rather than sent as
        # null when it does not apply.
        #
        # Casing is snake_case because these ride the same webhook stream customers
        # already parse message_id from; the question/answer contract is a separate
        # surface and stays camelCase. Nothing here is provider-shaped: no provider call
        # id, no namespaced identity.
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
            payload: T.nilable(Sentdm::CallEventPayload),
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
