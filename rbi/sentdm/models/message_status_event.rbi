# typed: strong

module Sentdm
  module Models
    class MessageStatusEvent < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageStatusEvent, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :status

      sig { returns(Time) }
      attr_accessor :timestamp

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # A human-readable sentence for reason_code. Omitted whenever reason_code is.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # Why the message reached this status, as a stable platform code such as
      # DELIVERY_007. Present on FAILED, FILTERED and BLOCKED events; omitted on every
      # status that needs no explanation. Same wire name and vocabulary as on the
      # activities list and the webhook.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason_code

      # Represents a status change event in a message's lifecycle (v3)
      sig do
        params(
          status: String,
          timestamp: Time,
          description: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        status:,
        timestamp:,
        description: nil,
        # A human-readable sentence for reason_code. Omitted whenever reason_code is.
        reason: nil,
        # Why the message reached this status, as a stable platform code such as
        # DELIVERY_007. Present on FAILED, FILTERED and BLOCKED events; omitted on every
        # status that needs no explanation. Same wire name and vocabulary as on the
        # activities list and the webhook.
        reason_code: nil
      )
      end

      sig do
        override.returns(
          {
            status: String,
            timestamp: Time,
            description: T.nilable(String),
            reason: T.nilable(String),
            reason_code: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
