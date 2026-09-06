# frozen_string_literal: true

module Sentdm
  module Models
    class InboundMessageEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute inbound_number
      #   The contact's number in E.164 format, meaning the number the message came from.
      #
      #   @return [String]
      required :inbound_number, String

      # @!attribute received_at
      #   When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      #
      #   @return [String]
      required :received_at, String

      # @!attribute account_id
      #   The account the message belongs to.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute channel
      #   The channel the message arrived on, for example sms or whatsapp.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute message_id
      #   The inbound message.
      #
      #   @return [String, nil]
      optional :message_id, String

      # @!attribute outbound_number
      #   Your number in E.164 format, meaning the number the message was addressed to.
      #
      #   @return [String, nil]
      optional :outbound_number, String

      # @!attribute text
      #   The message body. Sent as null when the inbound message carried no text, for
      #   example a media-only message. The field is always present, so read it and check
      #   for null rather than checking whether the key exists.
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!attribute updated_at
      #   When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ). Same value as
      #   ReceivedAt, kept for envelope consistency with outbound events.
      #
      #   @return [String, nil]
      optional :updated_at, String

      # @!method initialize(inbound_number:, received_at:, account_id: nil, channel: nil, message_id: nil, outbound_number: nil, text: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::InboundMessageEventPayload} for more details.
      #
      #   Body of a message.received event. Delivered when a contact messages one of your
      #   numbers.
      #
      #   @param inbound_number [String] The contact's number in E.164 format, meaning the number the message came from.
      #
      #   @param received_at [String] When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      #
      #   @param account_id [String] The account the message belongs to.
      #
      #   @param channel [String] The channel the message arrived on, for example sms or whatsapp.
      #
      #   @param message_id [String] The inbound message.
      #
      #   @param outbound_number [String] Your number in E.164 format, meaning the number the message was addressed to.
      #
      #   @param text [String, nil] The message body. Sent as null when the inbound message carried no text, for
      #
      #   @param updated_at [String] When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ). Same value as
    end
  end
end
