# typed: strong

module Sentdm
  module Models
    class ContactMessageSummary < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactMessageSummary, Sentdm::Internal::AnyHash)
        end

      sig do
        returns(
          T.nilable(T::Array[Sentdm::ContactMessageSummary::ChannelScore])
        )
      end
      attr_reader :channel_scores

      sig do
        params(
          channel_scores:
            T::Array[Sentdm::ContactMessageSummary::ChannelScore::OrHash]
        ).void
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
          channel_scores:
            T::Array[Sentdm::ContactMessageSummary::ChannelScore::OrHash],
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
            channel_scores:
              T::Array[Sentdm::ContactMessageSummary::ChannelScore],
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

      class ChannelScore < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ContactMessageSummary::ChannelScore,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :channel

        sig { params(channel: String).void }
        attr_writer :channel

        # Percentage (0-100) of messages on this channel that ended in FAILED.
        sig { returns(T.nilable(Integer)) }
        attr_reader :fail_score

        sig { params(fail_score: Integer).void }
        attr_writer :fail_score

        # Percentage (0-100) of messages on this channel that reached a successful
        # terminal state: SENT/DELIVERED/READ for outbound, RECEIVED for inbound.
        sig { returns(T.nilable(Integer)) }
        attr_reader :success_score

        sig { params(success_score: Integer).void }
        attr_writer :success_score

        sig do
          params(
            channel: String,
            fail_score: Integer,
            success_score: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          channel: nil,
          # Percentage (0-100) of messages on this channel that ended in FAILED.
          fail_score: nil,
          # Percentage (0-100) of messages on this channel that reached a successful
          # terminal state: SENT/DELIVERED/READ for outbound, RECEIVED for inbound.
          success_score: nil
        )
        end

        sig do
          override.returns(
            { channel: String, fail_score: Integer, success_score: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
