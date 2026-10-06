# frozen_string_literal: true

module Sentdm
  module Models
    class MessageEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute message_status
      #   The status the message just reached, for example SENT, DELIVERED, or FAILED.
      #   Sent means dispatched and delivered means confirmed, so treat them as distinct
      #   outcomes.
      #
      #   @return [String]
      required :message_status, String

      # @!attribute account_id
      #   The account the message belongs to.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute agent_id
      #   The agent attributed to the send, when the send was attributed to one.
      #
      #   @return [String, nil]
      optional :agent_id, String, nil?: true

      # @!attribute body
      #   The rendered message body, as plain text. Sent as null when we aren't asserting
      #   a body for this event. The field is always present, so read it and check for
      #   null rather than checking whether the key exists. Truncated to 3072 characters.
      #
      #   @return [String, nil]
      optional :body, String, nil?: true

      # @!attribute channel
      #   The channel the message went out on, for example sms or whatsapp. A message that
      #   falls back to another channel reports the channel actually used.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute message_id
      #   The message this event describes. Stable across every event in the message's
      #   lifecycle, so use it to correlate them.
      #
      #   @return [String, nil]
      optional :message_id, String

      # @!attribute outbound_number
      #   The recipient's number in E.164 format.
      #
      #   @return [String, nil]
      optional :outbound_number, String

      # @!attribute reason
      #   A human-readable sentence for ReasonCode, for example "The recipient is not
      #   registered on this channel". Omitted whenever reason_code is.
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   Why the message reached this status, as a stable platform code such as
      #   DELIVERY_007 or BUSINESS_003. Present on message.failed, message.filtered and
      #   message.blocked; omitted on every status that needs no explanation. Switch on
      #   this rather than on Reason: the code is stable, the wording may be improved. It
      #   is the platform's classification of the outcome and never a carrier or vendor
      #   code.
      #
      #   @return [String, nil]
      optional :reason_code, String, nil?: true

      # @!attribute schedule_reason
      #   message.scheduled only: why the message is held, either because you scheduled it
      #   or because the recipient is inside a protected quiet-hours window. Omitted on
      #   every other event, including message.cancelled — that is a property of the hold,
      #   not of the cancellation, and repeating it there would read as "why was this
      #   cancelled", which it does not answer.
      #
      #   @return [String, nil]
      optional :schedule_reason, String, nil?: true

      # @!attribute scheduled_at
      #   message.scheduled and message.cancelled only, in UTC (yyyy-MM-ddTHH:mm:ssZ): on
      #   message.scheduled it is when the held message will be released for delivery, on
      #   message.cancelled the release instant that was called off — the same instant,
      #   before and after. A consumer that recorded a future send from the first event
      #   has what it needs to un-record it from the second. Omitted on every other event.
      #
      #   @return [String, nil]
      optional :scheduled_at, String, nil?: true

      # @!attribute template_id
      #   The template the message was sent from, when it was sent from one.
      #
      #   @return [String, nil]
      optional :template_id, String, nil?: true

      # @!attribute template_name
      #   Name of the template the message was sent from. Omitted when the message wasn't
      #   template-based.
      #
      #   @return [String, nil]
      optional :template_name, String, nil?: true

      # @!attribute updated_at
      #   When the message reached MessageStatus, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      #
      #   @return [String, nil]
      optional :updated_at, String

      # @!method initialize(message_status:, account_id: nil, agent_id: nil, body: nil, channel: nil, message_id: nil, outbound_number: nil, reason: nil, reason_code: nil, schedule_reason: nil, scheduled_at: nil, template_id: nil, template_name: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageEventPayload} for more details.
      #
      #   Body of an outbound message lifecycle event. Delivered once per status change,
      #   so a single message produces several of these as it moves toward a terminal
      #   status.
      #
      #   @param message_status [String] The status the message just reached, for example SENT, DELIVERED, or
      #
      #   @param account_id [String] The account the message belongs to.
      #
      #   @param agent_id [String, nil] The agent attributed to the send, when the send was attributed to one.
      #
      #   @param body [String, nil] The rendered message body, as plain text. Sent as null when we aren't asserting
      #
      #   @param channel [String] The channel the message went out on, for example sms or whatsapp. A message
      #
      #   @param message_id [String] The message this event describes. Stable across every event in the message's lif
      #
      #   @param outbound_number [String] The recipient's number in E.164 format.
      #
      #   @param reason [String, nil] A human-readable sentence for ReasonCode, for example "The recipient is not regi
      #
      #   @param reason_code [String, nil] Why the message reached this status, as a stable platform code such as
      #
      #   @param schedule_reason [String, nil] message.scheduled only: why the message is held, either because you scheduled it
      #
      #   @param scheduled_at [String, nil] message.scheduled and message.cancelled only, in UTC (yyyy-MM-ddTHH:mm:ssZ): on
      #
      #   @param template_id [String, nil] The template the message was sent from, when it was sent from one.
      #
      #   @param template_name [String, nil] Name of the template the message was sent from. Omitted when the message wasn't
      #
      #   @param updated_at [String] When the message reached MessageStatus, in UTC
    end
  end
end
