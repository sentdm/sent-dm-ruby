# frozen_string_literal: true

module Sentdm
  module Models
    class CallTimelineEntry < Sentdm::Internal::Type::BaseModel
      # @!attribute status
      #   initiated, ringing, answered, completed, failed, no_answer or rejected
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
      #   @param status [String] initiated, ringing, answered, completed, failed, no_answer or rejected
      #
      #   @param timestamp [Time] When the call entered this status (UTC)
    end
  end
end
