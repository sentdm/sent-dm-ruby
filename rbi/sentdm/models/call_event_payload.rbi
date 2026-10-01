# typed: strong

module Sentdm
  module Models
    class CallEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::CallEventPayload, Sentdm::Internal::AnyHash)
        end

      # Sent's call id, the same one the customer saw on the first question.
      sig { returns(String) }
      attr_accessor :call_id

      # The account the call belongs to: the key's own customer, or the sender profile
      # it acted as.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # Always voice.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # How long the call lasted. Only on call.completed.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :duration_seconds

      # The customer number that owns the call, in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :number

      sig { params(number: String).void }
      attr_writer :number

      # What the call was charged. Only on call.completed, and omitted there until
      # billing has recorded the charge.
      sig { returns(T.nilable(Float)) }
      attr_accessor :price

      # The machine-readable reason the call did not complete. Only on call.failed, and
      # omitted when no reason was recorded.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # The recording that became available, the same id GET /v3/calls/{id}/recordings
      # lists it under. Only on call.recording_ready, which is sent once per recording.
      sig { returns(T.nilable(String)) }
      attr_accessor :recording_id

      # When the change happened on the call, as opposed to when the event was emitted.
      sig { returns(T.nilable(String)) }
      attr_reader :updated_at

      sig { params(updated_at: String).void }
      attr_writer :updated_at

      # Body of a call.initiated, call.answered, call.completed, call.failed or
      # call.recording_ready event. Which of them occurred is the envelope's event.
      #
      # Shaped like the message, inbound, template and channel payloads: account_id
      # names the account the event is about, channel names the channel, and updated_at
      # is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
      # duration_seconds and price are added on call.completed, reason on call.failed
      # and recording_id on call.recording_ready; each is omitted rather than sent as
      # null when it does not apply.
      #
      # Casing is snake_case because these ride the same webhook stream customers
      # already parse message_id from; the question/answer contract is a separate
      # surface and stays camelCase. Nothing here is provider-shaped: no provider call
      # id, no namespaced identity.
      sig do
        params(
          call_id: String,
          account_id: String,
          channel: String,
          duration_seconds: T.nilable(Integer),
          number: String,
          price: T.nilable(Float),
          reason: T.nilable(String),
          recording_id: T.nilable(String),
          updated_at: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Sent's call id, the same one the customer saw on the first question.
        call_id:,
        # The account the call belongs to: the key's own customer, or the sender profile
        # it acted as.
        account_id: nil,
        # Always voice.
        channel: nil,
        # How long the call lasted. Only on call.completed.
        duration_seconds: nil,
        # The customer number that owns the call, in E.164 format.
        number: nil,
        # What the call was charged. Only on call.completed, and omitted there until
        # billing has recorded the charge.
        price: nil,
        # The machine-readable reason the call did not complete. Only on call.failed, and
        # omitted when no reason was recorded.
        reason: nil,
        # The recording that became available, the same id GET /v3/calls/{id}/recordings
        # lists it under. Only on call.recording_ready, which is sent once per recording.
        recording_id: nil,
        # When the change happened on the call, as opposed to when the event was emitted.
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            call_id: String,
            account_id: String,
            channel: String,
            duration_seconds: T.nilable(Integer),
            number: String,
            price: T.nilable(Float),
            reason: T.nilable(String),
            recording_id: T.nilable(String),
            updated_at: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
