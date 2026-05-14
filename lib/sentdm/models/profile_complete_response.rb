# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#complete
    class ProfileCompleteResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Response when a profile is already in the completed state and no further action
      #   is taken.
      #
      #   @return [Sentdm::Models::ProfileCompleteResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ProfileCompleteResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ProfileCompleteResponse::Error, nil]
      optional :error, -> { Sentdm::Models::ProfileCompleteResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::ProfileCompleteResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::ProfileCompleteResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileCompleteResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ProfileCompleteResponse::Data, nil] Response when a profile is already in the completed state and no further action
      #
      #   @param error [Sentdm::Models::ProfileCompleteResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::ProfileCompleteResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ProfileCompleteResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable message describing the result.
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute status
        #   Current process status of the profile (e.g., "completed", "submitted",
        #   "in_progress").
        #
        #   @return [String, nil]
        optional :status, String

        # @!method initialize(message: nil, status: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::ProfileCompleteResponse::Data} for more details.
        #
        #   Response when a profile is already in the completed state and no further action
        #   is taken.
        #
        #   @param message [String] Human-readable message describing the result.
        #
        #   @param status [String] Current process status of the profile (e.g., "completed", "submitted", "in_progr
      end

      # @see Sentdm::Models::ProfileCompleteResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

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

      # @see Sentdm::Models::ProfileCompleteResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

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

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
