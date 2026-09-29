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
      #   The channel the message arrived on, for example sms or mms.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute media
      #   Attachments the contact sent, present only on channels that carry them (mms
      #   today) and omitted entirely otherwise.
      #
      #   Each url points at the carrier's own copy of the file — sent.dm records where
      #   the attachment is, not the attachment itself. The link is unauthenticated and
      #   expires on the carrier's schedule, which differs between them: assume days, not
      #   months. Download what you need on receipt; re-reading the message through GET
      #   /v3/messages/{id} returns the same stored link, not a fresh one, so once it
      #   lapses the entry remains with whatever the carrier declared about the file but
      #   the file is no longer reachable.
      #
      #   @return [Array<Sentdm::Models::InboundMessageEventPayload::Media>, nil]
      optional :media,
               -> { Sentdm::Internal::Type::ArrayOf[Sentdm::InboundMessageEventPayload::Media] },
               nil?: true

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

      # @!method initialize(inbound_number:, received_at:, account_id: nil, channel: nil, media: nil, message_id: nil, outbound_number: nil, text: nil, updated_at: nil)
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
      #   @param channel [String] The channel the message arrived on, for example sms or mms.
      #
      #   @param media [Array<Sentdm::Models::InboundMessageEventPayload::Media>, nil] Attachments the contact sent, present only on channels that carry them (mms toda
      #
      #   @param message_id [String] The inbound message.
      #
      #   @param outbound_number [String] Your number in E.164 format, meaning the number the message was addressed to.
      #
      #   @param text [String, nil] The message body. Sent as null when the inbound message carried no text, for
      #
      #   @param updated_at [String] When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ). Same value as

      class Media < Sentdm::Internal::Type::BaseModel
        # @!attribute hash_sha256
        #   SHA-256 of the file as the carrier declared it, when it declares one. Verify
        #   what you download against this — sent.dm never reads the bytes, so it is the
        #   only integrity signal available.
        #
        #   @return [String, nil]
        optional :hash_sha256, String, nil?: true

        # @!attribute mime_type
        #   Content type as the carrier reported it, for example image/jpeg.
        #
        #   @return [String, nil]
        optional :mime_type, String, nil?: true

        # @!attribute size_bytes
        #   Size in bytes as the carrier declared it. Absent when it declared none.
        #
        #   @return [Integer, nil]
        optional :size_bytes, Integer, nil?: true

        # @!attribute url
        #   Where the carrier hosts the attachment.
        #
        #   This link expires and is not authenticated. sent.dm relays it rather than
        #   copying the file, so how long it stays fetchable is the carrier's decision and
        #   differs between them — assume days, not months. Anyone holding the URL can fetch
        #   it until it lapses. Copy the file on receipt if you need it to outlive that
        #   window; do not store this URL as a permanent reference.
        #
        #   @return [String, nil]
        optional :url, String, nil?: true

        # @!method initialize(hash_sha256: nil, mime_type: nil, size_bytes: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::InboundMessageEventPayload::Media} for more details.
        #
        #   One attachment on an inbound message.
        #
        #   @param hash_sha256 [String, nil] SHA-256 of the file as the carrier declared it, when it declares one. Verify wha
        #
        #   @param mime_type [String, nil] Content type as the carrier reported it, for example image/jpeg.
        #
        #   @param size_bytes [Integer, nil] Size in bytes as the carrier declared it. Absent when it declared none.
        #
        #   @param url [String, nil] Where the carrier hosts the attachment.
      end
    end
  end
end
