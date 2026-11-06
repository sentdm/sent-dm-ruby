# typed: strong

module Sentdm
  module Models
    class InboundMessageEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::InboundMessageEventPayload, Sentdm::Internal::AnyHash)
        end

      # The contact's number in E.164 format, meaning the number the message came from.
      sig { returns(String) }
      attr_accessor :inbound_number

      # When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      sig { returns(String) }
      attr_accessor :received_at

      # The account the message belongs to.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # The channel the message arrived on, for example sms or mms.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # Attachments the contact sent, present only on channels that carry them (mms
      # today) and omitted entirely otherwise.
      #
      # Each url points at the carrier's own copy of the file — sent.dm records where
      # the attachment is, not the attachment itself. The link is unauthenticated and
      # expires on the carrier's schedule, which differs between them: assume days, not
      # months. Download what you need on receipt; re-reading the message through GET
      # /v3/messages/{id} returns the same stored link, not a fresh one, so once it
      # lapses the entry remains with whatever the carrier declared about the file but
      # the file is no longer reachable.
      sig { returns(T.nilable(T::Array[Sentdm::InboundMedia])) }
      attr_accessor :media

      # The inbound message.
      sig { returns(T.nilable(String)) }
      attr_reader :message_id

      sig { params(message_id: String).void }
      attr_writer :message_id

      # Your number in E.164 format, meaning the number the message was addressed to.
      sig { returns(T.nilable(String)) }
      attr_reader :outbound_number

      sig { params(outbound_number: String).void }
      attr_writer :outbound_number

      # The ad the contact tapped to start the conversation, present only on whatsapp
      # messages sent from a Click to WhatsApp ad and omitted entirely otherwise.
      #
      # This is Meta's referral object passed through unchanged, with Meta's field names
      # and nesting: source_url, source_id, source_type, headline, body, media_type,
      # image_url (image ads), video_url and thumbnail_url (video ads), ctwa_clid and
      # welcome_message.text. Which fields appear is Meta's decision: ctwa_clid in
      # particular is not sent for ads shown in WhatsApp Status, so treat every field as
      # optional.
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :referral

      # The message body. Sent as null when the inbound message carried no text, for
      # example a media-only message. The field is always present, so read it and check
      # for null rather than checking whether the key exists.
      sig { returns(T.nilable(String)) }
      attr_accessor :text

      # When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ). Same value as
      # ReceivedAt, kept for envelope consistency with outbound events.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # Body of a message.received event. Delivered when a contact messages one of your
      # numbers.
      sig do
        params(
          inbound_number: String,
          received_at: String,
          account_id: String,
          channel: String,
          media: T.nilable(T::Array[Sentdm::InboundMedia::OrHash]),
          message_id: String,
          outbound_number: String,
          referral: T.nilable(T.anything),
          text: T.nilable(String),
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The contact's number in E.164 format, meaning the number the message came from.
        inbound_number:,
        # When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ).
        received_at:,
        # The account the message belongs to.
        account_id: nil,
        # The channel the message arrived on, for example sms or mms.
        channel: nil,
        # Attachments the contact sent, present only on channels that carry them (mms
        # today) and omitted entirely otherwise.
        #
        # Each url points at the carrier's own copy of the file — sent.dm records where
        # the attachment is, not the attachment itself. The link is unauthenticated and
        # expires on the carrier's schedule, which differs between them: assume days, not
        # months. Download what you need on receipt; re-reading the message through GET
        # /v3/messages/{id} returns the same stored link, not a fresh one, so once it
        # lapses the entry remains with whatever the carrier declared about the file but
        # the file is no longer reachable.
        media: nil,
        # The inbound message.
        message_id: nil,
        # Your number in E.164 format, meaning the number the message was addressed to.
        outbound_number: nil,
        # The ad the contact tapped to start the conversation, present only on whatsapp
        # messages sent from a Click to WhatsApp ad and omitted entirely otherwise.
        #
        # This is Meta's referral object passed through unchanged, with Meta's field names
        # and nesting: source_url, source_id, source_type, headline, body, media_type,
        # image_url (image ads), video_url and thumbnail_url (video ads), ctwa_clid and
        # welcome_message.text. Which fields appear is Meta's decision: ctwa_clid in
        # particular is not sent for ads shown in WhatsApp Status, so treat every field as
        # optional.
        referral: nil,
        # The message body. Sent as null when the inbound message carried no text, for
        # example a media-only message. The field is always present, so read it and check
        # for null rather than checking whether the key exists.
        text: nil,
        # When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ). Same value as
        # ReceivedAt, kept for envelope consistency with outbound events.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            inbound_number: String,
            received_at: String,
            account_id: String,
            channel: String,
            media: T.nilable(T::Array[Sentdm::InboundMedia]),
            message_id: String,
            outbound_number: String,
            referral: T.nilable(T.anything),
            text: T.nilable(String),
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
