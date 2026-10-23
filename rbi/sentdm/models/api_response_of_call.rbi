# typed: strong

module Sentdm
  module Models
    class APIResponseOfCall < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::APIResponseOfCall, Sentdm::Internal::AnyHash)
        end

      # A call record
      sig { returns(T.nilable(Sentdm::APIResponseOfCall::Data)) }
      attr_reader :data

      sig do
        params(data: T.nilable(Sentdm::APIResponseOfCall::Data::OrHash)).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::ErrorDetail)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::APIResponseOfCall::Data::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # A call record
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::APIResponseOfCall::Data),
            error: T.nilable(Sentdm::ErrorDetail),
            meta: Sentdm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::APIResponseOfCall::Data, Sentdm::Internal::AnyHash)
          end

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
        # insufficient_balance, destination_blocked, callback_not_configured, rejected or
        # no_answer. Null while the call is live, when it completed, and when it failed
        # without a recorded reason
        sig { returns(T.nilable(String)) }
        attr_accessor :failure_reason

        # One end of a call
        sig { returns(T.nilable(Sentdm::APIResponseOfCall::Data::From)) }
        attr_reader :from

        sig { params(from: Sentdm::APIResponseOfCall::Data::From::OrHash).void }
        attr_writer :from

        # The calling mode: inapp for a call between people in your app and phone numbers,
        # routed by your number's callback URL
        sig { returns(T.nilable(String)) }
        attr_reader :mode

        sig { params(mode: String).void }
        attr_writer :mode

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

        # INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # When the call entered each status, oldest first. Only returned when reading one
        # call
        sig do
          returns(
            T.nilable(T::Array[Sentdm::APIResponseOfCall::Data::Timeline])
          )
        end
        attr_accessor :timeline

        # One end of a call
        sig { returns(T.nilable(Sentdm::APIResponseOfCall::Data::To)) }
        attr_reader :to

        sig { params(to: Sentdm::APIResponseOfCall::Data::To::OrHash).void }
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
            from: Sentdm::APIResponseOfCall::Data::From::OrHash,
            mode: String,
            number: String,
            price: T.nilable(Float),
            recording_available: T::Boolean,
            started_at: Time,
            status: String,
            timeline:
              T.nilable(
                T::Array[Sentdm::APIResponseOfCall::Data::Timeline::OrHash]
              ),
            to: Sentdm::APIResponseOfCall::Data::To::OrHash
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
          # insufficient_balance, destination_blocked, callback_not_configured, rejected or
          # no_answer. Null while the call is live, when it completed, and when it failed
          # without a recorded reason
          failure_reason: nil,
          # One end of a call
          from: nil,
          # The calling mode: inapp for a call between people in your app and phone numbers,
          # routed by your number's callback URL
          mode: nil,
          # Your number that owns the call, in E.164 format: the dialed number for an
          # inbound call, the caller's bound number for a call placed from your app
          number: nil,
          # What the call cost. Null until it has been priced
          price: nil,
          # True once a recording of the call is available
          recording_available: nil,
          # When the call was placed (UTC)
          started_at: nil,
          # INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
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
              from: Sentdm::APIResponseOfCall::Data::From,
              mode: String,
              number: String,
              price: T.nilable(Float),
              recording_available: T::Boolean,
              started_at: Time,
              status: String,
              timeline:
                T.nilable(T::Array[Sentdm::APIResponseOfCall::Data::Timeline]),
              to: Sentdm::APIResponseOfCall::Data::To
            }
          )
        end
        def to_hash
        end

        class From < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::APIResponseOfCall::Data::From,
                Sentdm::Internal::AnyHash
              )
            end

          # user for one of your app users, number for a phone number, conference for a
          # room, anonymous for a caller who withheld their number
          sig { returns(T.nilable(String)) }
          attr_reader :kind

          sig { params(kind: String).void }
          attr_writer :kind

          # The app user's identity, the phone number in E.164 format, or the room name.
          # Null when the kind is anonymous
          sig { returns(T.nilable(String)) }
          attr_accessor :value

          # One end of a call
          sig do
            params(kind: String, value: T.nilable(String)).returns(
              T.attached_class
            )
          end
          def self.new(
            # user for one of your app users, number for a phone number, conference for a
            # room, anonymous for a caller who withheld their number
            kind: nil,
            # The app user's identity, the phone number in E.164 format, or the room name.
            # Null when the kind is anonymous
            value: nil
          )
          end

          sig { override.returns({ kind: String, value: T.nilable(String) }) }
          def to_hash
          end
        end

        class Timeline < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::APIResponseOfCall::Data::Timeline,
                Sentdm::Internal::AnyHash
              )
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
          sig do
            params(status: String, timestamp: Time).returns(T.attached_class)
          end
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

        class To < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::APIResponseOfCall::Data::To,
                Sentdm::Internal::AnyHash
              )
            end

          # user for one of your app users, number for a phone number, conference for a
          # room, anonymous for a caller who withheld their number
          sig { returns(T.nilable(String)) }
          attr_reader :kind

          sig { params(kind: String).void }
          attr_writer :kind

          # The app user's identity, the phone number in E.164 format, or the room name.
          # Null when the kind is anonymous
          sig { returns(T.nilable(String)) }
          attr_accessor :value

          # One end of a call
          sig do
            params(kind: String, value: T.nilable(String)).returns(
              T.attached_class
            )
          end
          def self.new(
            # user for one of your app users, number for a phone number, conference for a
            # room, anonymous for a caller who withheld their number
            kind: nil,
            # The app user's identity, the phone number in E.164 format, or the room name.
            # Null when the kind is anonymous
            value: nil
          )
          end

          sig { override.returns({ kind: String, value: T.nilable(String) }) }
          def to_hash
          end
        end
      end
    end
  end
end
