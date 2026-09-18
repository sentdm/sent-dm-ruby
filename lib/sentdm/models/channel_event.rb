# frozen_string_literal: true

module Sentdm
  module Models
    class ChannelEvent < Sentdm::Internal::Type::BaseModel
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
      #   Body of a channel event: where one of the customer's channels stands in
      #   provisioning and compliance. Delivered when a milestone moves — a registration
      #   filed, a verdict returned, a resubmission asked for, a sender gone live — so a
      #   customer's own onboarding UI does not have to poll GET /v3/channels.
      #
      #   The subject is one item, never the account. A customer's "SMS channel" has no
      #   status; a market does. Country, NumberType and SenderValue name which one, so a
      #   customer terminating only to Kosovo never receives an event about US 10DLC.
      #
      #   Status is the stable half of the contract. It is the same four-value set GET
      #   /v3/channels publishes, computed through the same code, so an event and a read
      #   of the same market cannot disagree. A subscriber that reads nothing but the
      #   status and the subject fields is a correct subscriber. The sub-type on the
      #   envelope names the specific milestone and is additive — that vocabulary comes
      #   from registries and carriers, which are parties Sent does not control.
      #
      #   Status means provisioning and compliance are complete, not that a send will
      #   succeed right now. An account can be suspended, or a destination blocked by a
      #   routing rule, without either showing up here. Those are separate surfaces and
      #   deliberately not modelled on this payload.
      #
      #   @return [Sentdm::Models::ChannelEventPayload, nil]
      optional :payload, -> { Sentdm::ChannelEventPayload }, nil?: true

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
      #   {Sentdm::Models::ChannelEvent} for more details.
      #
      #   The envelope Sent POSTs to a subscribed webhook endpoint. Every event shares
      #   this shape and varies only in Payload.
      #
      #   @param event [String, nil] The specific event within the family, for example message.delivered,
      #
      #   @param field [String] The event family, for example message, templates or contact. Route on
      #
      #   @param payload [Sentdm::Models::ChannelEventPayload, nil] Body of a channel event: where one of the customer's channels stands in provisio
      #
      #   @param request_id [String, nil] The event-specific body.
      #
      #   @param timestamp [String] When Sent emitted the event, in UTC (yyyy-MM-ddTHH:mm:ssZ). This is the emission
    end
  end
end
