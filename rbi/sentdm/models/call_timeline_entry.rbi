# typed: strong

module Sentdm
  module Models
    class CallTimelineEntry < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::CallTimelineEntry, Sentdm::Internal::AnyHash)
        end

      # INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When the call entered this status (UTC)
      sig { returns(T.nilable(Time)) }
      attr_reader :timestamp

      sig { params(timestamp: Time).void }
      attr_writer :timestamp

      # When a call entered a status
      sig { params(status: String, timestamp: Time).returns(T.attached_class) }
      def self.new(
        # INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
        status: nil,
        # When the call entered this status (UTC)
        timestamp: nil
      )
      end

      sig { override.returns({ status: String, timestamp: Time }) }
      def to_hash
      end
    end
  end
end
