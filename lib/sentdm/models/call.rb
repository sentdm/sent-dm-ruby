# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Calls#list
    class Call < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   The call id, the same one carried by the call.request question and every call
      #   webhook
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute answered_at
      #   When the call was answered (UTC). Null until then, and always null for a call
      #   between two of your app users
      #
      #   @return [Time, nil]
      optional :answered_at, Time, nil?: true

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
      #   insufficient_balance, destination_blocked, rejected or no_answer. Null while the
      #   call is live, when it completed, and when it failed without a recorded reason
      #
      #   @return [String, nil]
      optional :failure_reason, String, nil?: true

      # @!attribute from
      #   One end of a call
      #
      #   @return [Sentdm::Models::CallParty, nil]
      optional :from, -> { Sentdm::CallParty }

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
      #   initiated, ringing, answered, completed, failed, no_answer or rejected
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute timeline
      #   When the call entered each status, oldest first. Only returned when reading one
      #   call
      #
      #   @return [Array<Sentdm::Models::CallTimelineEntry>, nil]
      optional :timeline, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::CallTimelineEntry] }, nil?: true

      # @!attribute to
      #   One end of a call
      #
      #   @return [Sentdm::Models::CallParty, nil]
      optional :to, -> { Sentdm::CallParty }

      # @!method initialize(id: nil, answered_at: nil, direction: nil, duration_seconds: nil, ended_at: nil, failure_reason: nil, from: nil, number: nil, price: nil, recording_available: nil, started_at: nil, status: nil, timeline: nil, to: nil)
      #   Some parameter documentations has been truncated, see {Sentdm::Models::Call} for
      #   more details.
      #
      #   A call record
      #
      #   @param id [String] The call id, the same one carried by the call.request question and every call we
      #
      #   @param answered_at [Time, nil] When the call was answered (UTC). Null until then, and always null for a call be
      #
      #   @param direction [String] outbound for a call placed from your app, inbound for a call to one of your numb
      #
      #   @param duration_seconds [Integer, nil] Billable duration in seconds. Null while the call is live
      #
      #   @param ended_at [Time, nil] When the call ended (UTC). Null while the call is live
      #
      #   @param failure_reason [String, nil] Why the call did not complete: callback_timeout, invalid_answer, insufficient_ba
      #
      #   @param from [Sentdm::Models::CallParty] One end of a call
      #
      #   @param number [String] Your number that owns the call, in E.164 format: the dialed number for an inboun
      #
      #   @param price [Float, nil] What the call cost. Null until it has been priced
      #
      #   @param recording_available [Boolean] True once a recording of the call is available
      #
      #   @param started_at [Time] When the call was placed (UTC)
      #
      #   @param status [String] initiated, ringing, answered, completed, failed, no_answer or rejected
      #
      #   @param timeline [Array<Sentdm::Models::CallTimelineEntry>, nil] When the call entered each status, oldest first. Only returned when reading one
      #
      #   @param to [Sentdm::Models::CallParty] One end of a call
    end
  end
end
