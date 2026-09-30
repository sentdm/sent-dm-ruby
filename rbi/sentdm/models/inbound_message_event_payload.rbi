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
      sig do
        returns(T.nilable(T::Array[Sentdm::InboundMessageEventPayload::Media]))
      end
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
          media:
            T.nilable(
              T::Array[Sentdm::InboundMessageEventPayload::Media::OrHash]
            ),
          message_id: String,
          outbound_number: String,
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
            media:
              T.nilable(T::Array[Sentdm::InboundMessageEventPayload::Media]),
            message_id: String,
            outbound_number: String,
            text: T.nilable(String),
            updated_at: String
          }
        )
      end
      def to_hash
      end

      class Media < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::InboundMessageEventPayload::Media,
              Sentdm::Internal::AnyHash
            )
          end

        # SHA-256 of the file as the carrier declared it, when it declares one. Verify
        # what you download against this — sent.dm never reads the bytes, so it is the
        # only integrity signal available.
        sig { returns(T.nilable(String)) }
        attr_accessor :hash_sha256

        # Content type as the carrier reported it, for example image/jpeg.
        sig { returns(T.nilable(String)) }
        attr_accessor :mime_type

        # Size in bytes as the carrier declared it. Absent when it declared none.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :size_bytes

        # Where the carrier hosts the attachment.
        #
        # This link expires and is not authenticated. sent.dm relays it rather than
        # copying the file, so how long it stays fetchable is the carrier's decision and
        # differs between them — assume days, not months. Anyone holding the URL can fetch
        # it until it lapses. Copy the file on receipt if you need it to outlive that
        # window; do not store this URL as a permanent reference.
        sig { returns(T.nilable(String)) }
        attr_accessor :url

        # One attachment on an inbound message.
        sig do
          params(
            hash_sha256: T.nilable(String),
            mime_type: T.nilable(String),
            size_bytes: T.nilable(Integer),
            url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # SHA-256 of the file as the carrier declared it, when it declares one. Verify
          # what you download against this — sent.dm never reads the bytes, so it is the
          # only integrity signal available.
          hash_sha256: nil,
          # Content type as the carrier reported it, for example image/jpeg.
          mime_type: nil,
          # Size in bytes as the carrier declared it. Absent when it declared none.
          size_bytes: nil,
          # Where the carrier hosts the attachment.
          #
          # This link expires and is not authenticated. sent.dm relays it rather than
          # copying the file, so how long it stays fetchable is the carrier's decision and
          # differs between them — assume days, not months. Anyone holding the URL can fetch
          # it until it lapses. Copy the file on receipt if you need it to outlive that
          # window; do not store this URL as a permanent reference.
          url: nil
        )
        end

        sig do
          override.returns(
            {
              hash_sha256: T.nilable(String),
              mime_type: T.nilable(String),
              size_bytes: T.nilable(Integer),
              url: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
