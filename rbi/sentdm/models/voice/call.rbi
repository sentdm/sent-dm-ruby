# typed: strong

module Sentdm
  module Models
    module Voice
      class Call < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(Sentdm::Voice::Call, Sentdm::Internal::AnyHash) }

        # The call id, the same one carried by the call.request question and every call
        # webhook
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # The voice agent that answered the call, such as
        # agent_9f2ab000-0000-4000-8000-000000000001. Null for an inapp call
        sig { returns(T.nilable(String)) }
        attr_accessor :agent_id

        # When the call was answered (UTC). Null until then, and always null for a call
        # between two of your app users
        sig { returns(T.nilable(Time)) }
        attr_accessor :answered_at

        # The caller id shown on the phone leg, in E.164 format: the one your answer
        # chose, or the owning number when it chose none. Null for a call with no phone
        # leg
        sig { returns(T.nilable(String)) }
        attr_accessor :caller_id_used

        # The phone number the call was connected to, in E.164 format: the number your
        # answer dialed, or the fallback number a call to one of your voice agents
        # reached. Null when the call was not connected to a phone number
        sig { returns(T.nilable(String)) }
        attr_accessor :connected_number

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
        # insufficient_balance, destination_blocked, callback_not_configured, rejected,
        # no_answer, or for an agent call agent_busy or agent_unreachable. Null while the
        # call is live, when it completed, and when it failed without a recorded reason
        sig { returns(T.nilable(String)) }
        attr_accessor :failure_reason

        # One end of a call
        sig { returns(T.nilable(Sentdm::Voice::CallParty)) }
        attr_reader :from

        sig { params(from: Sentdm::Voice::CallParty::OrHash).void }
        attr_writer :from

        # The legs the price covers, one entry per billed leg, each with its own cost: a
        # call your answer connected to a phone number ran the caller's leg to your number
        # and the leg to the connected number at once, and both are billed. Null until the
        # call has been priced
        sig { returns(T.nilable(T::Array[Sentdm::Voice::Call::Leg])) }
        attr_accessor :legs

        # The calling mode: inapp for a call between people in your app and phone numbers,
        # routed by your number's callback URL; agent for a call one of your voice agents
        # answered
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
        sig { returns(T.nilable(T::Array[Sentdm::Voice::CallTimelineEntry])) }
        attr_accessor :timeline

        # One end of a call
        sig { returns(T.nilable(Sentdm::Voice::CallParty)) }
        attr_reader :to

        sig { params(to: Sentdm::Voice::CallParty::OrHash).void }
        attr_writer :to

        # A call record
        sig do
          params(
            id: String,
            agent_id: T.nilable(String),
            answered_at: T.nilable(Time),
            caller_id_used: T.nilable(String),
            connected_number: T.nilable(String),
            direction: String,
            duration_seconds: T.nilable(Integer),
            ended_at: T.nilable(Time),
            failure_reason: T.nilable(String),
            from: Sentdm::Voice::CallParty::OrHash,
            legs: T.nilable(T::Array[Sentdm::Voice::Call::Leg::OrHash]),
            mode: String,
            number: String,
            price: T.nilable(Float),
            recording_available: T::Boolean,
            started_at: Time,
            status: String,
            timeline:
              T.nilable(T::Array[Sentdm::Voice::CallTimelineEntry::OrHash]),
            to: Sentdm::Voice::CallParty::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The call id, the same one carried by the call.request question and every call
          # webhook
          id: nil,
          # The voice agent that answered the call, such as
          # agent_9f2ab000-0000-4000-8000-000000000001. Null for an inapp call
          agent_id: nil,
          # When the call was answered (UTC). Null until then, and always null for a call
          # between two of your app users
          answered_at: nil,
          # The caller id shown on the phone leg, in E.164 format: the one your answer
          # chose, or the owning number when it chose none. Null for a call with no phone
          # leg
          caller_id_used: nil,
          # The phone number the call was connected to, in E.164 format: the number your
          # answer dialed, or the fallback number a call to one of your voice agents
          # reached. Null when the call was not connected to a phone number
          connected_number: nil,
          # outbound for a call placed from your app, inbound for a call to one of your
          # numbers
          direction: nil,
          # Billable duration in seconds. Null while the call is live
          duration_seconds: nil,
          # When the call ended (UTC). Null while the call is live
          ended_at: nil,
          # Why the call did not complete: callback_timeout, invalid_answer,
          # insufficient_balance, destination_blocked, callback_not_configured, rejected,
          # no_answer, or for an agent call agent_busy or agent_unreachable. Null while the
          # call is live, when it completed, and when it failed without a recorded reason
          failure_reason: nil,
          # One end of a call
          from: nil,
          # The legs the price covers, one entry per billed leg, each with its own cost: a
          # call your answer connected to a phone number ran the caller's leg to your number
          # and the leg to the connected number at once, and both are billed. Null until the
          # call has been priced
          legs: nil,
          # The calling mode: inapp for a call between people in your app and phone numbers,
          # routed by your number's callback URL; agent for a call one of your voice agents
          # answered
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
              agent_id: T.nilable(String),
              answered_at: T.nilable(Time),
              caller_id_used: T.nilable(String),
              connected_number: T.nilable(String),
              direction: String,
              duration_seconds: T.nilable(Integer),
              ended_at: T.nilable(Time),
              failure_reason: T.nilable(String),
              from: Sentdm::Voice::CallParty,
              legs: T.nilable(T::Array[Sentdm::Voice::Call::Leg]),
              mode: String,
              number: String,
              price: T.nilable(Float),
              recording_available: T::Boolean,
              started_at: Time,
              status: String,
              timeline: T.nilable(T::Array[Sentdm::Voice::CallTimelineEntry]),
              to: Sentdm::Voice::CallParty
            }
          )
        end
        def to_hash
        end

        class Leg < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(Sentdm::Voice::Call::Leg, Sentdm::Internal::AnyHash)
            end

          # The whole minutes the leg was billed for
          sig { returns(T.nilable(Integer)) }
          attr_reader :billed_minutes

          sig { params(billed_minutes: Integer).void }
          attr_writer :billed_minutes

          # What the leg cost, in the same unit as the call's price
          sig { returns(T.nilable(Float)) }
          attr_reader :cost

          sig { params(cost: Float).void }
          attr_writer :cost

          # The currency of the cost: USD
          sig { returns(T.nilable(String)) }
          attr_reader :currency

          sig { params(currency: String).void }
          attr_writer :currency

          # inbound for the caller's leg to your number, outbound for a leg placed on your
          # behalf
          sig { returns(T.nilable(String)) }
          attr_reader :direction

          sig { params(direction: String).void }
          attr_writer :direction

          # The phone number the leg reached, in E.164 format: your number for the inbound
          # leg, the number dialed for an outbound one. Null for a leg to one of your app
          # users or a room
          sig { returns(T.nilable(String)) }
          attr_accessor :number

          # One leg of a call the price covers
          sig do
            params(
              billed_minutes: Integer,
              cost: Float,
              currency: String,
              direction: String,
              number: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The whole minutes the leg was billed for
            billed_minutes: nil,
            # What the leg cost, in the same unit as the call's price
            cost: nil,
            # The currency of the cost: USD
            currency: nil,
            # inbound for the caller's leg to your number, outbound for a leg placed on your
            # behalf
            direction: nil,
            # The phone number the leg reached, in E.164 format: your number for the inbound
            # leg, the number dialed for an outbound one. Null for a leg to one of your app
            # users or a room
            number: nil
          )
          end

          sig do
            override.returns(
              {
                billed_minutes: Integer,
                cost: Float,
                currency: String,
                direction: String,
                number: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
