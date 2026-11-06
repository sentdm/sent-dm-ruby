# frozen_string_literal: true

module Sentdm
  module Models
    class MessageStatusEvent < Sentdm::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [String]
      required :status, String

      # @!attribute timestamp
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute reason
      #   A human-readable sentence for reason_code. Omitted whenever reason_code is.
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   Why the message reached this status, as a stable platform code such as
      #   DELIVERY_007. Present on FAILED, FILTERED and BLOCKED events; omitted on every
      #   status that needs no explanation. Same wire name and vocabulary as on the
      #   activities list and the webhook.
      #
      #   @return [String, nil]
      optional :reason_code, String, nil?: true

      # @!method initialize(status:, timestamp:, description: nil, reason: nil, reason_code: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageStatusEvent} for more details.
      #
      #   Represents a status change event in a message's lifecycle (v3)
      #
      #   @param status [String]
      #
      #   @param timestamp [Time]
      #
      #   @param description [String, nil]
      #
      #   @param reason [String, nil] A human-readable sentence for reason_code. Omitted whenever reason_code is.
      #
      #   @param reason_code [String, nil] Why the message reached this status, as a stable platform code such as
      #   DELIVERY\_
    end
  end
end
