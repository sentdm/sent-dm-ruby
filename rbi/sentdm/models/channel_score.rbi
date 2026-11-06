# typed: strong

module Sentdm
  module Models
    class ChannelScore < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::ChannelScore, Sentdm::Internal::AnyHash) }

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
