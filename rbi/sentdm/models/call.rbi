# typed: strong

module Sentdm
  module Models
    class Call < Sentdm::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Sentdm::Call, Sentdm::Internal::AnyHash) }

      # The call id, the same one carried by the call.request question and every call
      # webhook
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # When the call was answered (UTC). Null until then, and always null for a call
      # between two of your app users
      sig { returns(T.nilable(Time)) }
      attr_accessor :answered_at

      # outbound for a call placed from your app, inbound for a call to one of your
      # numbers
      sig { returns(T.nilable(String)) }
      attr_reader :direction

      sig { params(direction: String).void }
      attr_writer :direction

      # Billable duration in seconds. Null while the call is live
      sig { returns(T.nilable(Integer)) }
      attr_accessor :duration_seconds

      # When the call ended (UTC). Null while the call is live
      sig { returns(T.nilable(Time)) }
      attr_accessor :ended_at

      # Why the call did not complete: callback_timeout, invalid_answer,
      # insufficient_balance, destination_blocked, rejected or no_answer. Null while the
      # call is live, when it completed, and when it failed without a recorded reason
      sig { returns(T.nilable(String)) }
      attr_accessor :failure_reason

      # One end of a call
      sig { returns(T.nilable(Sentdm::CallParty)) }
      attr_reader :from

      sig { params(from: Sentdm::CallParty::OrHash).void }
      attr_writer :from

      # Your number that owns the call, in E.164 format: the dialed number for an
      # inbound call, the caller's bound number for a call placed from your app
      sig { returns(T.nilable(String)) }
      attr_reader :number

      sig { params(number: String).void }
      attr_writer :number

      # What the call cost. Null until it has been priced
      sig { returns(T.nilable(Float)) }
      attr_accessor :price

      # True once a recording of the call is available
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :recording_available

      sig { params(recording_available: T::Boolean).void }
      attr_writer :recording_available

      # When the call was placed (UTC)
      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      # initiated, ringing, answered, completed, failed, no_answer or rejected
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # When the call entered each status, oldest first. Only returned when reading one
      # call
      sig { returns(T.nilable(T::Array[Sentdm::CallTimelineEntry])) }
      attr_accessor :timeline

      # One end of a call
      sig { returns(T.nilable(Sentdm::CallParty)) }
      attr_reader :to

      sig { params(to: Sentdm::CallParty::OrHash).void }
      attr_writer :to

      # A call record
      sig do
        params(
          id: String,
          answered_at: T.nilable(Time),
          direction: String,
          duration_seconds: T.nilable(Integer),
          ended_at: T.nilable(Time),
          failure_reason: T.nilable(String),
          from: Sentdm::CallParty::OrHash,
          number: String,
          price: T.nilable(Float),
          recording_available: T::Boolean,
          started_at: Time,
          status: String,
          timeline: T.nilable(T::Array[Sentdm::CallTimelineEntry::OrHash]),
          to: Sentdm::CallParty::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The call id, the same one carried by the call.request question and every call
        # webhook
        id: nil,
        # When the call was answered (UTC). Null until then, and always null for a call
        # between two of your app users
        answered_at: nil,
        # outbound for a call placed from your app, inbound for a call to one of your
        # numbers
        direction: nil,
        # Billable duration in seconds. Null while the call is live
        duration_seconds: nil,
        # When the call ended (UTC). Null while the call is live
        ended_at: nil,
        # Why the call did not complete: callback_timeout, invalid_answer,
        # insufficient_balance, destination_blocked, rejected or no_answer. Null while the
        # call is live, when it completed, and when it failed without a recorded reason
        failure_reason: nil,
        # One end of a call
        from: nil,
        # Your number that owns the call, in E.164 format: the dialed number for an
        # inbound call, the caller's bound number for a call placed from your app
        number: nil,
        # What the call cost. Null until it has been priced
        price: nil,
        # True once a recording of the call is available
        recording_available: nil,
        # When the call was placed (UTC)
        started_at: nil,
        # initiated, ringing, answered, completed, failed, no_answer or rejected
        status: nil,
        # When the call entered each status, oldest first. Only returned when reading one
        # call
        timeline: nil,
        # One end of a call
        to: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            answered_at: T.nilable(Time),
            direction: String,
            duration_seconds: T.nilable(Integer),
            ended_at: T.nilable(Time),
            failure_reason: T.nilable(String),
            from: Sentdm::CallParty,
            number: String,
            price: T.nilable(Float),
            recording_available: T::Boolean,
            started_at: Time,
            status: String,
            timeline: T.nilable(T::Array[Sentdm::CallTimelineEntry]),
            to: Sentdm::CallParty
          }
        )
      end
      def to_hash
      end
    end
  end
end
