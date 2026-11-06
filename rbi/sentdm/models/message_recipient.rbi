# typed: strong

module Sentdm
  module Models
    class MessageRecipient < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageRecipient, Sentdm::Internal::AnyHash)
        end

      # Resolved template body for this recipient's channel, or null when the channel is
      # auto-detected.
      sig { returns(T.nilable(String)) }
      attr_accessor :body

      # Channel this message will be sent on — sms, whatsapp — or null to auto-detect.
      sig { returns(T.nilable(String)) }
      attr_accessor :channel

      # Identifier for tracking this recipient's message.
      sig { returns(T.nilable(String)) }
      attr_reader :message_id

      sig { params(message_id: String).void }
      attr_writer :message_id

      # Phone number in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :to

      sig { params(to: String).void }
      attr_writer :to

      # What one recipient of a send got, as the API reports it.
      sig do
        params(
          body: T.nilable(String),
          channel: T.nilable(String),
          message_id: String,
          to: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Resolved template body for this recipient's channel, or null when the channel is
        # auto-detected.
        body: nil,
        # Channel this message will be sent on — sms, whatsapp — or null to auto-detect.
        channel: nil,
        # Identifier for tracking this recipient's message.
        message_id: nil,
        # Phone number in E.164 format.
        to: nil
      )
      end

      sig do
        override.returns(
          {
            body: T.nilable(String),
            channel: T.nilable(String),
            message_id: String,
            to: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
