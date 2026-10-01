# frozen_string_literal: true

module Sentdm
  module Models
    class CallEvent < Sentdm::Internal::Type::BaseModel
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
      #   Body of a call.initiated, call.answered, call.completed, call.failed or
      #   call.recording_ready event. Which of them occurred is the envelope's event.
      #
      #   Shaped like the message, inbound, template and channel payloads: account_id
      #   names the account the event is about, channel names the channel, and updated_at
      #   is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
      #   duration_seconds and price are added on call.completed, reason on call.failed
      #   and recording_id on call.recording_ready; each is omitted rather than sent as
      #   null when it does not apply.
      #
      #   Casing is snake_case because these ride the same webhook stream customers
      #   already parse message_id from; the question/answer contract is a separate
      #   surface and stays camelCase. Nothing here is provider-shaped: no provider call
      #   id, no namespaced identity.
      #
      #   @return [Sentdm::Models::CallEventPayload, nil]
      optional :payload, -> { Sentdm::CallEventPayload }, nil?: true

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
      #   {Sentdm::Models::CallEvent} for more details.
      #
      #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
      #   this shape and varies only in Payload.
      #
      #   @param event [String, nil] The specific event within the family, for example message.delivered,
      #
      #   @param field [String] The event family, for example message, templates or contact. Route on
      #
      #   @param payload [Sentdm::Models::CallEventPayload, nil] Body of a call.initiated, call.answered, call.completed, call.failed
      #
      #   @param request_id [String, nil] The event-specific body.
      #
      #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
    end
  end
end
