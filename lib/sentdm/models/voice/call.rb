# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Calls#list
      class Call < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   The call id, the same one carried by the call.request question and every call
        #   webhook
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute agent_id
        #   The voice agent that answered the call, such as
        #   agent_9f2ab000-0000-4000-8000-000000000001. Null for an inapp call
        #
        #   @return [String, nil]
        optional :agent_id, String, nil?: true

        # @!attribute answered_at
        #   When the call was answered (UTC). Null until then, and always null for a call
        #   between two of your app users
        #
        #   @return [Time, nil]
        optional :answered_at, Time, nil?: true

        # @!attribute caller_id_used
        #   The caller id shown on the phone leg, in E.164 format: the one your answer
        #   chose, or the owning number when it chose none. Null for a call with no phone
        #   leg
        #
        #   @return [String, nil]
        optional :caller_id_used, String, nil?: true

        # @!attribute connected_number
        #   The phone number the call was connected to, in E.164 format: the number your
        #   answer dialed, or the fallback number a call to one of your voice agents
        #   reached. Null when the call was not connected to a phone number
        #
        #   @return [String, nil]
        optional :connected_number, String, nil?: true

        # @!attribute direction
        #   outbound for a call placed from your app, inbound for a call to one of your
        #   numbers
        #
        #   @return [String, nil]
        optional :direction, String

        # @!attribute duration_seconds
        #   Billable duration in seconds. Null while the call is live
        #
        #   @return [Integer, nil]
        optional :duration_seconds, Integer, nil?: true

        # @!attribute ended_at
        #   When the call ended (UTC). Null while the call is live
        #
        #   @return [Time, nil]
        optional :ended_at, Time, nil?: true

        # @!attribute failure_reason
        #   Why the call did not complete: callback_timeout, invalid_answer,
        #   insufficient_balance, destination_blocked, callback_not_configured, rejected,
        #   no_answer, or for an agent call agent_busy or agent_unreachable. Null while the
        #   call is live, when it completed, and when it failed without a recorded reason
        #
        #   @return [String, nil]
        optional :failure_reason, String, nil?: true

        # @!attribute from
        #   One end of a call
        #
        #   @return [Sentdm::Models::Voice::CallParty, nil]
        optional :from, -> { Sentdm::Voice::CallParty }

        # @!attribute legs
        #   The legs the price covers, one entry per billed leg, each with its own cost: a
        #   call your answer connected to a phone number ran the caller's leg to your number
        #   and the leg to the connected number at once, and both are billed. Null until the
        #   call has been priced
        #
        #   @return [Array<Sentdm::Models::Voice::Call::Leg>, nil]
        optional :legs, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::Call::Leg] }, nil?: true

        # @!attribute mode
        #   The calling mode: inapp for a call between people in your app and phone numbers,
        #   routed by your number's callback URL; agent for a call one of your voice agents
        #   answered
        #
        #   @return [String, nil]
        optional :mode, String

        # @!attribute number
        #   Your number that owns the call, in E.164 format: the dialed number for an
        #   inbound call, the caller's bound number for a call placed from your app
        #
        #   @return [String, nil]
        optional :number, String

        # @!attribute price
        #   What the call cost. Null until it has been priced
        #
        #   @return [Float, nil]
        optional :price, Float, nil?: true

        # @!attribute recording_available
        #   True once a recording of the call is available
        #
        #   @return [Boolean, nil]
        optional :recording_available, Sentdm::Internal::Type::Boolean

        # @!attribute started_at
        #   When the call was placed (UTC)
        #
        #   @return [Time, nil]
        optional :started_at, Time

        # @!attribute status
        #   INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute timeline
        #   When the call entered each status, oldest first. Only returned when reading one
        #   call
        #
        #   @return [Array<Sentdm::Models::Voice::CallTimelineEntry>, nil]
        optional :timeline,
                 -> {
                   Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::CallTimelineEntry]
                 },
                 nil?: true

        # @!attribute to
        #   One end of a call
        #
        #   @return [Sentdm::Models::Voice::CallParty, nil]
        optional :to, -> { Sentdm::Voice::CallParty }

        # @!method initialize(id: nil, agent_id: nil, answered_at: nil, caller_id_used: nil, connected_number: nil, direction: nil, duration_seconds: nil, ended_at: nil, failure_reason: nil, from: nil, legs: nil, mode: nil, number: nil, price: nil, recording_available: nil, started_at: nil, status: nil, timeline: nil, to: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::Call} for more details.
        #
        #   A call record
        #
        #   @param id [String] The call id, the same one carried by the call.request question and every call we
        #
        #   @param agent_id [String, nil] The voice agent that answered the call, such as agent_9f2ab000-0000-4000-8000-00
        #
        #   @param answered_at [Time, nil] When the call was answered (UTC). Null until then, and always null for a call be
        #
        #   @param caller_id_used [String, nil] The caller id shown on the phone leg, in E.164 format: the one your answer chose
        #
        #   @param connected_number [String, nil] The phone number the call was connected to, in E.164 format: the number your ans
        #
        #   @param direction [String] outbound for a call placed from your app, inbound for a call to one of your numb
        #
        #   @param duration_seconds [Integer, nil] Billable duration in seconds. Null while the call is live
        #
        #   @param ended_at [Time, nil] When the call ended (UTC). Null while the call is live
        #
        #   @param failure_reason [String, nil] Why the call did not complete: callback_timeout, invalid_answer, insufficient_ba
        #
        #   @param from [Sentdm::Models::Voice::CallParty] One end of a call
        #
        #   @param legs [Array<Sentdm::Models::Voice::Call::Leg>, nil] The legs the price covers, one entry per billed leg, each with its own cost: a c
        #
        #   @param mode [String] The calling mode: inapp for a call between people in your app and phone numbers,
        #
        #   @param number [String] Your number that owns the call, in E.164 format: the dialed number for an inboun
        #
        #   @param price [Float, nil] What the call cost. Null until it has been priced
        #
        #   @param recording_available [Boolean] True once a recording of the call is available
        #
        #   @param started_at [Time] When the call was placed (UTC)
        #
        #   @param status [String] INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
        #
        #   @param timeline [Array<Sentdm::Models::Voice::CallTimelineEntry>, nil] When the call entered each status, oldest first. Only returned when reading one
        #
        #   @param to [Sentdm::Models::Voice::CallParty] One end of a call

        class Leg < Sentdm::Internal::Type::BaseModel
          # @!attribute billed_minutes
          #   The whole minutes the leg was billed for
          #
          #   @return [Integer, nil]
          optional :billed_minutes, Integer

          # @!attribute cost
          #   What the leg cost, in the same unit as the call's price
          #
          #   @return [Float, nil]
          optional :cost, Float

          # @!attribute currency
          #   The currency of the cost: USD
          #
          #   @return [String, nil]
          optional :currency, String

          # @!attribute direction
          #   inbound for the caller's leg to your number, outbound for a leg placed on your
          #   behalf
          #
          #   @return [String, nil]
          optional :direction, String

          # @!attribute number
          #   The phone number the leg reached, in E.164 format: your number for the inbound
          #   leg, the number dialed for an outbound one. Null for a leg to one of your app
          #   users or a room
          #
          #   @return [String, nil]
          optional :number, String, nil?: true

          # @!method initialize(billed_minutes: nil, cost: nil, currency: nil, direction: nil, number: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Voice::Call::Leg} for more details.
          #
          #   One leg of a call the price covers
          #
          #   @param billed_minutes [Integer] The whole minutes the leg was billed for
          #
          #   @param cost [Float] What the leg cost, in the same unit as the call's price
          #
          #   @param currency [String] The currency of the cost: USD
          #
          #   @param direction [String] inbound for the caller's leg to your number, outbound for a leg placed on your b
          #
          #   @param number [String, nil] The phone number the leg reached, in E.164 format: your number for the inbound l
        end
      end
    end
  end
end
