# typed: strong

module Sentdm
  module Models
    class InboundMessageEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::InboundMessageEventPayload, Sentdm::Internal::AnyHash)
        end

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

      # The contact's number in E.164 format, meaning the number the message came from.
      sig { returns(T.nilable(String)) }
      attr_reader :inbound_number

      sig { params(inbound_number: String).void }
      attr_writer :inbound_number

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

      # When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      sig { returns(T.nilable(String)) }
      attr_reader :received_at

      sig { params(received_at: String).void }
      attr_writer :received_at

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
          account_id: String,
          channel: String,
          inbound_number: String,
          message_id: String,
          outbound_number: String,
          received_at: String,
          text: T.nilable(String),
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The account the message belongs to.
        account_id: nil,
        # The channel the message arrived on, for example sms or whatsapp.
        channel: nil,
        # The contact's number in E.164 format, meaning the number the message came from.
        inbound_number: nil,
        # The inbound message.
        message_id: nil,
        # Your number in E.164 format, meaning the number the message was addressed to.
        outbound_number: nil,
        # When the message was received, in UTC (yyyy-MM-ddTHH:mm:ssZ).
        received_at: nil,
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
            account_id: String,
            channel: String,
            inbound_number: String,
            message_id: String,
            outbound_number: String,
            received_at: String,
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
