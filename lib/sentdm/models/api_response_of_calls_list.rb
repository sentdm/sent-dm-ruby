# frozen_string_literal: true

module Sentdm
  module Models
    class APIResponseOfCallsList < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Paginated list of calls
      #
      #   @return [Sentdm::Models::APIResponseOfCallsList::Data, nil]
      optional :data, -> { Sentdm::APIResponseOfCallsList::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::APIResponseOfCallsList::Data, nil] Paginated list of calls
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::APIResponseOfCallsList#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute calls
        #   The calls on this page, most recent first
        #
        #   @return [Array<Sentdm::Models::APIResponseOfCallsList::Data::Call>, nil]
        optional :calls, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::APIResponseOfCallsList::Data::Call] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(calls: nil, pagination: nil)
        #   Paginated list of calls
        #
        #   @param calls [Array<Sentdm::Models::APIResponseOfCallsList::Data::Call>] The calls on this page, most recent first
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses

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
          #   insufficient_balance, destination_blocked, callback_not_configured, rejected or
          #   no_answer. Null while the call is live, when it completed, and when it failed
          #   without a recorded reason
          #
          #   @return [String, nil]
          optional :failure_reason, String, nil?: true

          # @!attribute from
          #   One end of a call
          #
          #   @return [Sentdm::Models::APIResponseOfCallsList::Data::Call::From, nil]
          optional :from, -> { Sentdm::APIResponseOfCallsList::Data::Call::From }

          # @!attribute mode
          #   The calling mode: inapp for a call between people in your app and phone numbers,
          #   routed by your number's callback URL
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
          #   @return [Array<Sentdm::Models::APIResponseOfCallsList::Data::Call::Timeline>, nil]
          optional :timeline,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::APIResponseOfCallsList::Data::Call::Timeline]
                   },
                   nil?: true

          # @!attribute to
          #   One end of a call
          #
          #   @return [Sentdm::Models::APIResponseOfCallsList::Data::Call::To, nil]
          optional :to, -> { Sentdm::APIResponseOfCallsList::Data::Call::To }

          # @!method initialize(id: nil, answered_at: nil, direction: nil, duration_seconds: nil, ended_at: nil, failure_reason: nil, from: nil, mode: nil, number: nil, price: nil, recording_available: nil, started_at: nil, status: nil, timeline: nil, to: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::APIResponseOfCallsList::Data::Call} for more details.
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
          #   @param from [Sentdm::Models::APIResponseOfCallsList::Data::Call::From] One end of a call
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
          #   @param timeline [Array<Sentdm::Models::APIResponseOfCallsList::Data::Call::Timeline>, nil] When the call entered each status, oldest first. Only returned when reading one
          #
          #   @param to [Sentdm::Models::APIResponseOfCallsList::Data::Call::To] One end of a call

          # @see Sentdm::Models::APIResponseOfCallsList::Data::Call#from
          class From < Sentdm::Internal::Type::BaseModel
            # @!attribute kind
            #   user for one of your app users, number for a phone number, conference for a
            #   room, anonymous for a caller who withheld their number
            #
            #   @return [String, nil]
            optional :kind, String

            # @!attribute value
            #   The app user's identity, the phone number in E.164 format, or the room name.
            #   Null when the kind is anonymous
            #
            #   @return [String, nil]
            optional :value, String, nil?: true

            # @!method initialize(kind: nil, value: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::APIResponseOfCallsList::Data::Call::From} for more details.
            #
            #   One end of a call
            #
            #   @param kind [String] user for one of your app users, number for a phone number, conference for a room
            #
            #   @param value [String, nil] The app user's identity, the phone number in E.164 format, or the room name. Nul
          end

          class Timeline < Sentdm::Internal::Type::BaseModel
            # @!attribute status
            #   INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
            #
            #   @return [String, nil]
            optional :status, String

            # @!attribute timestamp
            #   When the call entered this status (UTC)
            #
            #   @return [Time, nil]
            optional :timestamp, Time

            # @!method initialize(status: nil, timestamp: nil)
            #   When a call entered a status
            #
            #   @param status [String] INITIATED, RINGING, ANSWERED, COMPLETED, FAILED, NO_ANSWER or REJECTED
            #
            #   @param timestamp [Time] When the call entered this status (UTC)
          end

          # @see Sentdm::Models::APIResponseOfCallsList::Data::Call#to
          class To < Sentdm::Internal::Type::BaseModel
            # @!attribute kind
            #   user for one of your app users, number for a phone number, conference for a
            #   room, anonymous for a caller who withheld their number
            #
            #   @return [String, nil]
            optional :kind, String

            # @!attribute value
            #   The app user's identity, the phone number in E.164 format, or the room name.
            #   Null when the kind is anonymous
            #
            #   @return [String, nil]
            optional :value, String, nil?: true

            # @!method initialize(kind: nil, value: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::APIResponseOfCallsList::Data::Call::To} for more details.
            #
            #   One end of a call
            #
            #   @param kind [String] user for one of your app users, number for a phone number, conference for a room
            #
            #   @param value [String, nil] The app user's identity, the phone number in E.164 format, or the room name. Nul
          end
        end
      end
    end
  end
end
