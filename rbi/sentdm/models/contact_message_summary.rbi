# typed: strong

module Sentdm
  module Models
    class ContactMessageSummary < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactMessageSummary, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[Sentdm::ChannelScore])) }
      attr_reader :channel_scores

      sig do
        params(channel_scores: T::Array[Sentdm::ChannelScore::OrHash]).void
      end
      attr_writer :channel_scores

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :channels_used

      sig { params(channels_used: T::Array[String]).void }
      attr_writer :channels_used

      sig { returns(T.nilable(String)) }
      attr_reader :contact_id

      sig { params(contact_id: String).void }
      attr_writer :contact_id

      sig { returns(T.nilable(Time)) }
      attr_accessor :first_message_at

      sig { returns(T.nilable(Time)) }
      attr_accessor :last_message_at

      sig { returns(T.nilable(Integer)) }
      attr_reader :message_count

      sig { params(message_count: Integer).void }
      attr_writer :message_count

      sig do
        params(
          channel_scores: T::Array[Sentdm::ChannelScore::OrHash],
          channels_used: T::Array[String],
          contact_id: String,
          first_message_at: T.nilable(Time),
          last_message_at: T.nilable(Time),
          message_count: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        channel_scores: nil,
        channels_used: nil,
        contact_id: nil,
        first_message_at: nil,
        last_message_at: nil,
        message_count: nil
      )
      end

      sig do
        override.returns(
          {
            channel_scores: T::Array[Sentdm::ChannelScore],
            channels_used: T::Array[String],
            contact_id: String,
            first_message_at: T.nilable(Time),
            last_message_at: T.nilable(Time),
            message_count: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
