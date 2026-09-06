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

      # The channel the message arrived on, for example sms or whatsapp.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

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
        # The channel the message arrived on, for example sms or whatsapp.
        channel: nil,
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
            message_id: String,
            outbound_number: String,
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
