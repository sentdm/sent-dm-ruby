# typed: strong

module Sentdm
  module Models
    class MessageChannelOptions < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageChannelOptions, Sentdm::Internal::AnyHash)
        end

      # Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US).
      # Optional. Accepted and stored, not acted on yet.
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # Sender numbers in E.164. Each must be an active sender on your account for this
      # channel. That is account state rather than request shape, so it is decided per
      # message: the request is accepted with 202 and a message naming an unusable
      # number is recorded BLOCKED with error code BUSINESS_029.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :from

      # How to pick a number from From, e.g. sticky or geo. Optional. Accepted and
      # stored, not acted on yet.
      sig { returns(T.nilable(String)) }
      attr_accessor :strategy

      # One entry of a channel's list in Channels, e.g. {"country": "US", "from":
      # ["+15559990002", "+15559990003"], "strategy": "sticky"}.
      sig do
        params(
          country: T.nilable(String),
          from: T.nilable(T::Array[String]),
          strategy: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Recipient country this entry is meant for (ISO 3166-1 alpha-2, e.g. US).
        # Optional. Accepted and stored, not acted on yet.
        country: nil,
        # Sender numbers in E.164. Each must be an active sender on your account for this
        # channel. That is account state rather than request shape, so it is decided per
        # message: the request is accepted with 202 and a message naming an unusable
        # number is recorded BLOCKED with error code BUSINESS_029.
        from: nil,
        # How to pick a number from From, e.g. sticky or geo. Optional. Accepted and
        # stored, not acted on yet.
        strategy: nil
      )
      end

      sig do
        override.returns(
          {
            country: T.nilable(String),
            from: T.nilable(T::Array[String]),
            strategy: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
