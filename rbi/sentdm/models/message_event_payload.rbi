# typed: strong

module Sentdm
  module Models
    class MessageEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageEventPayload, Sentdm::Internal::AnyHash)
        end

      # The status the message just reached, for example SENT, DELIVERED, or FAILED.
      # Sent means dispatched and delivered means confirmed, so treat them as distinct
      # outcomes.
      sig { returns(String) }
      attr_accessor :message_status

      # The account the message belongs to.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # The agent attributed to the send, when the send was attributed to one.
      sig { returns(T.nilable(String)) }
      attr_accessor :agent_id

      # The channel the message went out on, for example sms or whatsapp. A message that
      # falls back to another channel reports the channel actually used.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # The message this event describes. Stable across every event in the message's
      # lifecycle, so use it to correlate them.
      sig { returns(T.nilable(String)) }
      attr_reader :message_id

      sig { params(message_id: String).void }
      attr_writer :message_id

      # The recipient's number in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :outbound_number

      sig { params(outbound_number: String).void }
      attr_writer :outbound_number

      # The template the message was sent from, when it was sent from one.
      sig { returns(T.nilable(String)) }
      attr_accessor :template_id

      # Name of the template the message was sent from. Omitted when the message wasn't
      # template-based.
      sig { returns(T.nilable(String)) }
      attr_accessor :template_name

      # When the message reached MessageStatus, in UTC (yyyy-MM-ddTHH:mm:ssZ).
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # Body of an outbound message lifecycle event. Delivered once per status change,
      # so a single message produces several of these as it moves toward a terminal
      # status.
      sig do
        params(
          message_status: String,
          account_id: String,
          agent_id: T.nilable(String),
          channel: String,
          message_id: String,
          outbound_number: String,
          template_id: T.nilable(String),
          template_name: T.nilable(String),
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The status the message just reached, for example SENT, DELIVERED, or FAILED.
        # Sent means dispatched and delivered means confirmed, so treat them as distinct
        # outcomes.
        message_status:,
        # The account the message belongs to.
        account_id: nil,
        # The agent attributed to the send, when the send was attributed to one.
        agent_id: nil,
        # The channel the message went out on, for example sms or whatsapp. A message that
        # falls back to another channel reports the channel actually used.
        channel: nil,
        # The message this event describes. Stable across every event in the message's
        # lifecycle, so use it to correlate them.
        message_id: nil,
        # The recipient's number in E.164 format.
        outbound_number: nil,
        # The template the message was sent from, when it was sent from one.
        template_id: nil,
        # Name of the template the message was sent from. Omitted when the message wasn't
        # template-based.
        template_name: nil,
        # When the message reached MessageStatus, in UTC (yyyy-MM-ddTHH:mm:ssZ).
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            message_status: String,
            account_id: String,
            agent_id: T.nilable(String),
            channel: String,
            message_id: String,
            outbound_number: String,
            template_id: T.nilable(String),
            template_name: T.nilable(String),
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
