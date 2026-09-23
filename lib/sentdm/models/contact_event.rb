# frozen_string_literal: true

module Sentdm
  module Models
    class ContactEvent < Sentdm::Internal::Type::BaseModel
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
      #   Body of a contact.opt_in, contact.opt_out, contact.help or
      #   contact.custom_keyword event. Delivered when a contact signals a consent change,
      #   asks for help, or sends one of your own auto-reply keywords.
      #
      #   These events state the signal outright, so you do not have to recognise keywords
      #   in the text of a message.received event. They also cover cases that produce no
      #   inbound message at all, such as a network handling an opt-out on your behalf.
      #
      #   Two of the four change consent and two do not: contact.help and
      #   contact.custom_keyword report the state the contact already had. Read opt_out
      #   for the state and the envelope's event for what happened, rather than inferring
      #   one from the other.
      #
      #   Fields are ordered identity → resulting state → provenance → join keys. The two
      #   parties are from and to. Note that the message family has not moved to those
      #   names yet — message.received still calls the same two parties inbound_number and
      #   outbound_number. Nothing here restates the envelope: which signal occurred is
      #   the envelope's event, and when it was emitted is its timestamp. Retries carry
      #   the same X-Webhook-Event-ID header, which is what to deduplicate on.
      #
      #   @return [Sentdm::Models::ContactEventPayload, nil]
      optional :payload, -> { Sentdm::ContactEventPayload }, nil?: true

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
      #   {Sentdm::Models::ContactEvent} for more details.
      #
      #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
      #   this shape and varies only in Payload.
      #
      #   @param event [String, nil] The specific event within the family, for example message.delivered,
      #
      #   @param field [String] The event family, for example message, templates or contact. Route on
      #
      #   @param payload [Sentdm::Models::ContactEventPayload, nil] Body of a contact.opt_in, contact.opt_out, contact.help or
      #
      #   @param request_id [String, nil] The event-specific body.
      #
      #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
    end
  end
end
