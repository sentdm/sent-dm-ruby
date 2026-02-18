# frozen_string_literal: true

module SentDm
  module Models
    class APIError < SentDm::Internal::Type::BaseModel
      # @!attribute code
      #   Machine-readable error code (e.g., "RESOURCE_001")
      #
      #   @return [String, nil]
      optional :code, String

      # @!attribute details
      #   Additional validation error details (field-level errors)
      #
      #   @return [Hash{Symbol=>Array<String>}, nil]
      optional :details, SentDm::Internal::Type::HashOf[SentDm::Internal::Type::ArrayOf[String]], nil?: true

      # @!attribute doc_url
      #   URL to documentation about this error
      #
      #   @return [String, nil]
      optional :doc_url, String, nil?: true

      # @!attribute message
      #   Human-readable error message
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
      #   Error information
      #
      #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
      #
      #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
      #
      #   @param doc_url [String, nil] URL to documentation about this error
      #
      #   @param message [String] Human-readable error message
    end
  end
end
