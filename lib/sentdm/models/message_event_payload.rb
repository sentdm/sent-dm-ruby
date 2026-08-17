# frozen_string_literal: true

module Sentdm
  module Models
    class MessageEventPayload < Sentdm::Internal::Type::BaseModel
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

      # @!attribute message_status
      #   The status the message just reached, for example SENT, DELIVERED, or FAILED.
      #   Sent means dispatched and delivered means confirmed, so treat them as distinct
      #   outcomes.
      #
      #   @return [String, nil]
      optional :message_status, String

      # @!attribute outbound_number
      #   The recipient's number in E.164 format.
      #
      #   @return [String, nil]
      optional :outbound_number, String

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

      # @!method initialize(account_id: nil, agent_id: nil, channel: nil, message_id: nil, message_status: nil, outbound_number: nil, template_id: nil, template_name: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageEventPayload} for more details.
      #
      #   Body of an outbound message lifecycle event. Delivered once per status change,
      #   so a single message produces several of these as it moves toward a terminal
      #   status.
      #
      #   @param account_id [String] The account the message belongs to.
      #
      #   @param agent_id [String, nil] The agent attributed to the send, when the send was attributed to one.
      #
      #   @param channel [String] The channel the message went out on, for example sms or whatsapp. A message
      #
      #   @param message_id [String] The message this event describes. Stable across every event in the message's lif
      #
      #   @param message_status [String] The status the message just reached, for example SENT, DELIVERED, or
      #
      #   @param outbound_number [String] The recipient's number in E.164 format.
      #
      #   @param template_id [String, nil] The template the message was sent from, when it was sent from one.
      #
      #   @param template_name [String, nil] Name of the template the message was sent from. Omitted when the message wasn't
      #
      #   @param updated_at [String] When the message reached MessageStatus, in UTC
    end
  end
end
