# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#update
    class WebhookUpdateResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::WebhookUpdateResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookUpdateResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::WebhookUpdateResponse::Error, nil]
      optional :error, -> { Sentdm::Models::WebhookUpdateResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::WebhookUpdateResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::WebhookUpdateResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::WebhookUpdateResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::WebhookUpdateResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::WebhookUpdateResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::WebhookUpdateResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute consecutive_failures
        #
        #   @return [Integer, nil]
        optional :consecutive_failures, Integer

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute display_name
        #
        #   @return [String, nil]
        optional :display_name, String

        # @!attribute endpoint_url
        #
        #   @return [String, nil]
        optional :endpoint_url, String

        # @!attribute event_filters
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :event_filters,
                 Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]],
                 nil?: true

        # @!attribute event_types
        #
        #   @return [Array<String>, nil]
        optional :event_types, Sentdm::Internal::Type::ArrayOf[String]

        # @!attribute is_active
        #
        #   @return [Boolean, nil]
        optional :is_active, Sentdm::Internal::Type::Boolean

        # @!attribute last_delivery_attempt_at
        #
        #   @return [Time, nil]
        optional :last_delivery_attempt_at, Time, nil?: true

        # @!attribute last_successful_delivery_at
        #
        #   @return [Time, nil]
        optional :last_successful_delivery_at, Time, nil?: true

        # @!attribute retry_count
        #
        #   @return [Integer, nil]
        optional :retry_count, Integer

        # @!attribute signing_secret
        #
        #   @return [String, nil]
        optional :signing_secret, String, nil?: true

        # @!attribute timeout_seconds
        #
        #   @return [Integer, nil]
        optional :timeout_seconds, Integer

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, nil?: true

        # @!method initialize(id: nil, consecutive_failures: nil, created_at: nil, display_name: nil, endpoint_url: nil, event_filters: nil, event_types: nil, is_active: nil, last_delivery_attempt_at: nil, last_successful_delivery_at: nil, retry_count: nil, signing_secret: nil, timeout_seconds: nil, updated_at: nil)
        #   The response data (null if error)
        #
        #   @param id [String]
        #   @param consecutive_failures [Integer]
        #   @param created_at [Time]
        #   @param display_name [String]
        #   @param endpoint_url [String]
        #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
        #   @param event_types [Array<String>]
        #   @param is_active [Boolean]
        #   @param last_delivery_attempt_at [Time, nil]
        #   @param last_successful_delivery_at [Time, nil]
        #   @param retry_count [Integer]
        #   @param signing_secret [String, nil]
        #   @param timeout_seconds [Integer]
        #   @param updated_at [Time, nil]
      end

      # @see Sentdm::Models::WebhookUpdateResponse#error
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

      # @see Sentdm::Models::WebhookUpdateResponse#meta
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
