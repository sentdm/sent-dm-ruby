# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_events
    class WebhookListEventsResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::WebhookListEventsResponse::Data, nil]
      optional :data, -> { Sentdm::Models::WebhookListEventsResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::WebhookListEventsResponse::Error, nil]
      optional :error, -> { Sentdm::Models::WebhookListEventsResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::WebhookListEventsResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::WebhookListEventsResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::WebhookListEventsResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::WebhookListEventsResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::WebhookListEventsResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::WebhookListEventsResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute events
        #
        #   @return [Array<Sentdm::Models::WebhookListEventsResponse::Data::Event>, nil]
        optional :events,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::WebhookListEventsResponse::Data::Event] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::WebhookListEventsResponse::Data::Pagination, nil]
        optional :pagination, -> { Sentdm::Models::WebhookListEventsResponse::Data::Pagination }

        # @!method initialize(events: nil, pagination: nil)
        #   The response data (null if error)
        #
        #   @param events [Array<Sentdm::Models::WebhookListEventsResponse::Data::Event>]
        #
        #   @param pagination [Sentdm::Models::WebhookListEventsResponse::Data::Pagination] Pagination metadata for list responses

        class Event < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute created_at
          #
          #   @return [Time, nil]
          optional :created_at, Time

          # @!attribute delivery_attempts
          #
          #   @return [Integer, nil]
          optional :delivery_attempts, Integer

          # @!attribute delivery_status
          #
          #   @return [String, nil]
          optional :delivery_status, String

          # @!attribute error_message
          #
          #   @return [String, nil]
          optional :error_message, String, nil?: true

          # @!attribute event_data
          #
          #   @return [Object, nil]
          optional :event_data, Sentdm::Internal::Type::Unknown

          # @!attribute event_type
          #
          #   @return [String, nil]
          optional :event_type, String

          # @!attribute http_status_code
          #
          #   @return [Integer, nil]
          optional :http_status_code, Integer, nil?: true

          # @!attribute processing_completed_at
          #
          #   @return [Time, nil]
          optional :processing_completed_at, Time, nil?: true

          # @!attribute processing_started_at
          #
          #   @return [Time, nil]
          optional :processing_started_at, Time, nil?: true

          # @!attribute response_body
          #
          #   @return [String, nil]
          optional :response_body, String, nil?: true

          # @!method initialize(id: nil, created_at: nil, delivery_attempts: nil, delivery_status: nil, error_message: nil, event_data: nil, event_type: nil, http_status_code: nil, processing_completed_at: nil, processing_started_at: nil, response_body: nil)
          #   @param id [String]
          #   @param created_at [Time]
          #   @param delivery_attempts [Integer]
          #   @param delivery_status [String]
          #   @param error_message [String, nil]
          #   @param event_data [Object]
          #   @param event_type [String]
          #   @param http_status_code [Integer, nil]
          #   @param processing_completed_at [Time, nil]
          #   @param processing_started_at [Time, nil]
          #   @param response_body [String, nil]
        end

        # @see Sentdm::Models::WebhookListEventsResponse::Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute cursors
          #   Cursor-based pagination pointers
          #
          #   @return [Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors, nil]
          optional :cursors, -> { Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors }, nil?: true

          # @!attribute has_more
          #   Whether there are more pages after this one
          #
          #   @return [Boolean, nil]
          optional :has_more, Sentdm::Internal::Type::Boolean

          # @!attribute page
          #   Current page number (1-indexed)
          #
          #   @return [Integer, nil]
          optional :page, Integer

          # @!attribute page_size
          #   Number of items per page
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute total_count
          #   Total number of items across all pages
          #
          #   @return [Integer, nil]
          optional :total_count, Integer

          # @!attribute total_pages
          #   Total number of pages
          #
          #   @return [Integer, nil]
          optional :total_pages, Integer

          # @!method initialize(cursors: nil, has_more: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
          #   Pagination metadata for list responses
          #
          #   @param cursors [Sentdm::Models::WebhookListEventsResponse::Data::Pagination::Cursors, nil] Cursor-based pagination pointers
          #
          #   @param has_more [Boolean] Whether there are more pages after this one
          #
          #   @param page [Integer] Current page number (1-indexed)
          #
          #   @param page_size [Integer] Number of items per page
          #
          #   @param total_count [Integer] Total number of items across all pages
          #
          #   @param total_pages [Integer] Total number of pages

          # @see Sentdm::Models::WebhookListEventsResponse::Data::Pagination#cursors
          class Cursors < Sentdm::Internal::Type::BaseModel
            # @!attribute after
            #   Cursor to fetch the next page
            #
            #   @return [String, nil]
            optional :after, String, nil?: true

            # @!attribute before
            #   Cursor to fetch the previous page
            #
            #   @return [String, nil]
            optional :before, String, nil?: true

            # @!method initialize(after: nil, before: nil)
            #   Cursor-based pagination pointers
            #
            #   @param after [String, nil] Cursor to fetch the next page
            #
            #   @param before [String, nil] Cursor to fetch the previous page
          end
        end
      end

      # @see Sentdm::Models::WebhookListEventsResponse#error
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

      # @see Sentdm::Models::WebhookListEventsResponse#meta
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
