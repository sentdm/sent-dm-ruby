# frozen_string_literal: true

module Sentdm
  module Models
    class CallEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute call_id
      #   Sent's call id, the same one the customer saw on the first question.
      #
      #   @return [String]
      required :call_id, String

      # @!attribute account_id
      #   The account the call belongs to: the key's own customer, or the sender profile
      #   it acted as.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute channel
      #   Always voice.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute duration_seconds
      #   How long the call lasted. Only on call.completed.
      #
      #   @return [Integer, nil]
      optional :duration_seconds, Integer, nil?: true

      # @!attribute number
      #   The customer number that owns the call, in E.164 format.
      #
      #   @return [String, nil]
      optional :number, String

      # @!attribute price
      #   What the call was charged. Only on call.completed, and omitted there until
      #   billing has recorded the charge.
      #
      #   @return [Float, nil]
      optional :price, Float, nil?: true

      # @!attribute reason
      #   The machine-readable reason the call did not complete. Only on call.failed, and
      #   omitted when no reason was recorded.
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute recording_id
      #   The recording that became available, the same id GET /v3/calls/{id}/recordings
      #   lists it under. Only on call.recording_ready, which is sent once per recording.
      #
      #   @return [String, nil]
      optional :recording_id, String, nil?: true

      # @!attribute updated_at
      #   When the change happened on the call, as opposed to when the event was emitted.
      #
      #   @return [String, nil]
      optional :updated_at, String

      # @!method initialize(call_id:, account_id: nil, channel: nil, duration_seconds: nil, number: nil, price: nil, reason: nil, recording_id: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::CallEventPayload} for more details.
      #
      #   Body of a call.initiated, call.answered, call.completed, call.failed or
      #   call.recording_ready event. Which of them occurred is the envelope's event.
      #
      #   Shaped like the message, inbound, template and channel payloads: account_id
      #   names the account the event is about, channel names the channel, and updated_at
      #   is when the change happened on the call, in the same yyyy-MM-ddTHH:mm:ssZ form.
      #   duration_seconds and price are added on call.completed, reason on call.failed
      #   and recording_id on call.recording_ready; each is omitted rather than sent as
      #   null when it does not apply.
      #
      #   Casing is snake_case because these ride the same webhook stream customers
      #   already parse message_id from; the question/answer contract is a separate
      #   surface and stays camelCase. Nothing here is provider-shaped: no provider call
      #   id, no namespaced identity.
      #
      #   @param call_id [String] Sent's call id, the same one the customer saw on the first question.
      #
      #   @param account_id [String] The account the call belongs to: the key's own customer, or the sender profile i
      #
      #   @param channel [String] Always voice.
      #
      #   @param duration_seconds [Integer, nil] How long the call lasted. Only on call.completed.
      #
      #   @param number [String] The customer number that owns the call, in E.164 format.
      #
      #   @param price [Float, nil] What the call was charged. Only on call.completed, and omitted there until billi
      #
      #   @param reason [String, nil] The machine-readable reason the call did not complete. Only on call.failed, and
      #
      #   @param recording_id [String, nil] The recording that became available, the same id GET /v3/calls/{id}/recordings l
      #
      #   @param updated_at [String] When the change happened on the call, as opposed to when the event was emitted.
    end
  end
end
