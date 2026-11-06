# typed: strong

module Sentdm
  module Models
    class CancelledMessage < Sentdm::Models::Message
      OrHash =
        T.type_alias do
          T.any(Sentdm::CancelledMessage, Sentdm::Internal::AnyHash)
        end

      # The send time that was called off, in UTC — the scheduled_at the message was
      # being held for, whether you set it or the recipient's quiet hours moved it
      # there. Omitted only for a held message that carried no recorded instant.
      sig { returns(T.nilable(Time)) }
      attr_accessor :scheduled_at

      # Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      # The shape of a message that was sent immediately: it never has a scheduled_at
      # key. A message that is or was held for a later instant is a
      # ScheduledMessageResponse, and the endpoint decides which of the two to answer
      # with. From always returns this type.
      sig { params(scheduled_at: T.nilable(Time)).returns(T.attached_class) }
      def self.new(
        # The send time that was called off, in UTC — the scheduled_at the message was
        # being held for, whether you set it or the recipient's quiet hours moved it
        # there. Omitted only for a held message that carried no recorded instant.
        scheduled_at: nil
      )
      end

      sig { override.returns({ scheduled_at: T.nilable(Time) }) }
      def to_hash
      end
    end
  end
end
