# frozen_string_literal: true

module Sentdm
  module Models
    class APIMeta < Sentdm::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique identifier for this request (for tracing and support)
      #
      #   @return [String, nil]
      optional :request_id, String

      # @!attribute response_time_ms
      #   Response time in milliseconds (optional)
      #
      #   @return [Integer, nil]
      optional :response_time_ms, Integer, nil?: true

      # @!attribute timestamp
      #   Server timestamp when the response was generated
      #
      #   @return [Time, nil]
      optional :timestamp, Time

      # @!attribute version
      #   API version used for this request
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(request_id: nil, response_time_ms: nil, timestamp: nil, version: nil)
      #   Request and response metadata
      #
      #   @param request_id [String] Unique identifier for this request (for tracing and support)
      #
      #   @param response_time_ms [Integer, nil] Response time in milliseconds (optional)
      #
      #   @param timestamp [Time] Server timestamp when the response was generated
      #
      #   @param version [String] API version used for this request
    end
  end
end
